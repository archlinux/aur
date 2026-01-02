# Maintainer:  Campbell Jones <arch at serebit dot com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=magpie-wm
_pkgname=magpie
pkgver=0.9.4
pkgrel=2
pkgdesc="Budgie's X11 window manager and compositor library forked from Mutter"
arch=(x86_64)
url="https://github.com/BuddiesOfBudgie/magpie"
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  fontconfig
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk3
  json-glib
  lcms2
  libcanberra
  libcolord
  libdrm
  libglvnd
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libwacom
  libx11
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  mesa
  mutter
  pango
  pipewire
  startup-notification
  systemd-libs
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  meson
  sysprof
  xorg-server
)
source=("git+https://github.com/BuddiesOfBudgie/magpie.git#tag=v$pkgver")
b2sums=(0090c17fdb6ee57892c45ca333c9d4e914e796e70c5dd3c17141b7e4b614994d422a25cb48e47b5a5219cfeafaed35d8748b367b0c36d5ecb10cf1ee0106f74e)
validpgpkeys=(
  1E1FB0017C998A8AE2C498A6C2EAA8A26ADC59EE # David Mohammed <fossfreedom at ubuntu dot com>
  0E0D97562A4EC8BD8E329DCDAA7A2325E04B609B # Joshua Strobl <me at joshuastrobl dot com>
)

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $_pkgname build \
    -D egl_device=true
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
