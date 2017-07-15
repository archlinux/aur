# Maintainer: foxcub <archlinux "at" foxcub {dot} org>
# Contributor: calegria  <calegria "at" gmail {dot} com>
pkgname=cgal-ipelets
pkgver=4.10
pkgrel=1
_ipever=7.2.7
pkgdesc="Ipelets from CGAL"
arch=('i686' 'x86_64')
url="http://www.cgal.org"
source=(https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-${pkgver}/CGAL-${pkgver}.tar.xz)
depends=('cgal' 'ipe')
makedepends=('cmake' 'boost' 'cgal' 'ipe')
license=('GPL')
md5sums=('0a60a756b6885580945122ee178dd8db')

build() {
  cd "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets"
  cmake .
  cmake . -DCMAKE_CXX_FLAGS="-std=c++11"        # putting it in the first line won't work (system-wide CGAL settings will override this choice)
  make
}

package() {
  mkdir -p "$pkgdir/usr/lib/ipe/$_ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/"*.so "$pkgdir/usr/lib/ipe/$_ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/lua/"* "$pkgdir/usr/lib/ipe/$_ipever/ipelets/"
}
