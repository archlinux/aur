# Maintainer: Tom Hacohen <tom@stosb.com>

pkgname=evolution-etesync-git
_pkgname=evolution-etesync
pkgver=1.0.0.r5.gc90f7d8
pkgrel=4
pkgdesc="EteSync (end-to-end encrypted sync) plugin for Evolution"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/evolution-etesync/"
license=('LGPL')
depends=(libgee json-glib evolution-data-server evolution libetebase)
makedepends=(cmake meson ninja vala git intltool glib2-devel)
provides=(evolution-etesync)
conflicts=(evolution-etesync)
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/evolution-etesync.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr .
  cmake --build build
}

package() {
  cd "$_pkgname"
  DESTDIR="${pkgdir}" cmake --install build
}
