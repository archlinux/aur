# Maintainer: Pellegrino Prevete (pellegrinoprevete@gmail.com)
# Maintainer: Liam Greenough (beacon515@gmail.com)
#Substantially adapted from the PKGBUILD of isl-git

_pkg="isl"
_major="15"
_pkgbase="lib${_pkg}"
_pkgname="isl${_major}"
pkgname="lib${_pkgname}"
pkgver="0.${_major}"
pkgrel=2
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints"
arch=('x86_64' 'i686' 'armv7h')
url="http://${_pkg}.gforge.inria.fr/"
depends=('gmp')
license=('MIT')
options=('!libtool')
provides=("${_pkg}=${pkgver}")
conflicts=("${_pkg}-git" "${_pkg}")
source=("http://${_pkgbase}.sourceforge.io/${_pkg}-${pkgver}.tar.gz")
md5sums=('ca0e2d172ff0b57764b10867c8fc762f')

build() {
  cd "${_pkg}-${pkgver}"
#  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "${_pkg}-${pkgver}"
  make check
}

package() {
  cd "${_pkg}-${pkgver}"
  make -j1 DESTDIR="$pkgdir/" install

  install -dm755 $pkgdir/usr/share/gdb/auto-load/usr/lib/
  mv $pkgdir/{,/usr/share/gdb/auto-load/}usr/lib/libisl.so.15.0.0-gdb.py

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/isl/LICENSE
}
