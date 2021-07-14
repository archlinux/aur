# Maintainer: Shaodong Wang <unclejimbo@qq.com>
pkgname=cgal-headers
_pkgname=CGAL
pkgver=5.3
pkgrel=2
pkgdesc="The Computational Geometry Algorithms Library."
arch=('any')
url='https://www.cgal.org/'
license=('GPL' 'LGPL')
depends=('mpfr' 'gmp' 'boost')
makedepends=('cmake')
source=("https://github.com/CGAL/cgal/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.xz")
sha512sums=('7490408ee2b2b0949999a835a7988ba1ec5bd87185adf4c3e72141ccc689a982b32a59206dba91e73fbcf571d9d41c3e607c68939bf44fdb5abfebde3452c26f')
provides=('cgal')
conflicts=('cgal')

prepare () {
  mkdir -p "${srcdir}/${_pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  cmake ../ \
  -DWITH_demos=False \
  -DWITH_examples=False \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" install
}
