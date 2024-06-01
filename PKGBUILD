# Maintainer: foxcub <archlinux "at" foxcub {dot} org>
# Contributor: calegria  <calegria "at" gmail {dot} com>
pkgname=cgal-ipelets
pkgver=5.6
pkgrel=3
_ipever=7.2.30
pkgdesc="Ipelets from CGAL"
arch=('i686' 'x86_64')
url="http://www.cgal.org"
source=(https://github.com/CGAL/cgal/releases/download/v${pkgver}/CGAL-${pkgver}.tar.xz)
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
md5sums=('e1bdd9233cb5489b3738fb0c98eb0365')
