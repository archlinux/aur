# Maintainer: foxcub <archlinux "at" foxcub {dot} org>
# Contributor: calegria  <calegria "at" gmail {dot} com>
pkgname=cgal-ipelets
pkgver=4.14.2
pkgrel=2
_ipever=7.2.15
pkgdesc="Ipelets from CGAL"
arch=('i686' 'x86_64')
url="http://www.cgal.org"
source=(https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-${pkgver}/CGAL-${pkgver}.tar.xz)
depends=('cgal' 'ipe')
makedepends=('cmake' 'boost' 'cgal' 'ipe' 'eigen')
license=('GPL')

build() {
  cd "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets"
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="-std=c++11"        # putting it in the first line won't work (system-wide CGAL settings will override this choice)
  make
}

package() {
  mkdir -p "$pkgdir/usr/lib/ipe/$_ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/build/"*.so "$pkgdir/usr/lib/ipe/$_ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/lua/"* "$pkgdir/usr/lib/ipe/$_ipever/ipelets/"
}
md5sums=('3e8ff310d55155a429d81fbf0278072e')
