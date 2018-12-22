# Maintainer: Claudio Cocciarelli <claudiococciarelli at gmail dot com>

pkgname=mutter-dev
pkgver=3.31.2
pkgrel=3
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire gnome-shell)
makedepends=(intltool gobject-introspection git egl-wayland)
provides=(mutter)
conflicts=(mutter)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=9a12befd22bff7bfd3afb12f2a774b3bcdf771ba")
sha256sums=('SKIP')

prepare() {
  cd mutter
  NOCONFIGURE=1 ./autogen.sh
}


build() {
  cd mutter
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum \
      --enable-gtk-doc --enable-egl-device --enable-remote-desktop
  make
}

package() {
  cd mutter
  make DESTDIR="$pkgdir" install
}
