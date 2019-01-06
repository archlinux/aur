# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libmutter2
pkgver=3.28.3
pkgrel=1
pkgdesc='A window manager library for GNOME'
url='https://gitlab.gnome.org/GNOME/mutter'
arch=(x86_64)
license=(GPL)
depends=(
  atk
  cairo
  dconf
  fontconfig
  gdk-pixbuf2
  glib2
  gnome-desktop
  gnome-settings-daemon
  gobject-introspection-runtime
  gtk3
  json-glib
  libcanberra
  libdrm
  libfreetype.so
  libgl
  libgudev-1.0.so
  libice
  libinput
  libsm
  libsystemd.so
  libudev.so
  libvorbisfile.so
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
  libxrender
  libxtst
  mesa
  pango
  startup-notification
  tdb
  upower
  wayland
  zenity
)
makedepends=(
  egl-wayland
  git
  gobject-introspection
  intltool
)
source=(git+https://gitlab.gnome.org/GNOME/mutter.git#tag=${pkgver})
sha256sums=(SKIP)

prepare() {
  cd mutter

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd mutter

  ./configure \
    --prefix='/usr' \
    --includedir='/usr/include/mutter-2' \
    --disable-gtk-doc \
    --disable-schemas-compile \
    --disable-remote-desktop \
    --disable-static \
    --enable-compile-warnings='minimum' \
    --enable-egl-device

  make
}

package() {
  make DESTDIR="${pkgdir}" -C mutter install
  rm -rf ${pkgdir}/usr/{bin,lib/mutter/plugins/default.so,libexec,share}
}

# vim: ts=2 sw=2 et:
