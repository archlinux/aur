# Maintainer: Capricornus007 <Capricornus007 at proton dot me>
# Co-Maintainer: nardholio <email hidden>
pkgname=muffin-git
pkgver=6.6.3.r37.gbabfe8a9
pkgrel=1
pkgdesc="Cinnamon window manager and compositor forked from Mutter (git version)"
arch=(x86_64)
url="https://github.com/linuxmint/muffin"
license=(GPL-2.0-or-later)
depends=(
  at-spi2-atk
  at-spi2-core
  cairo
  cjs
  clutter
  colord
  dconf
  gdk-pixbuf2
  glib2
  gnome-desktop
  gnome-settings-daemon
  gobject-introspection-runtime
  graphene
  gst-plugins-base
  gstreamer
  gtk3
  json-glib
  libcanberra
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libx11
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxkbcommon-x11
  libxrandr
  libxrender
  pango
  pipewire
  startup-notification
  wayland
  xorg-xwayland
)
makedepends=(
  git
  gobject-introspection
  meson
  samurai
  sysprof
)
provides=(muffin libmuffin-0)
conflicts=(muffin)
replaces=(muffin)
options=(!emptydirs)
source=("git+https://github.com/linuxmint/muffin.git")
b2sums=('SKIP')

pkgver() {
  cd muffin
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' 2>/dev/null \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd muffin
  # No patches needed
}

build() {
  arch-meson muffin build \
    --libexecdir lib/muffin \
    -D introspection=true \
    -D installed_tests=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
