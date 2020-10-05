# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=evolution-etesync-legacy
_pkgname=evolution-etesync
pkgver=0.5.1
pkgrel=1
pkgdesc="EteSync (end-to-end encrypted sync) plugin for Evolution - legacy (EteSync 1.0)"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/evolution-etesync/"
license=('LGPL')
depends=(libgee json-glib evolution-data-server evolution etesync)
makedepends=(cmake meson ninja vala git intltool)
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/evolution-etesync.git?tag=v$pkgver")
sha512sums=('SKIP')

build() {
  cd "$_pkgname"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname"
  cd build
  make DESTDIR="${pkgdir}" install
}
