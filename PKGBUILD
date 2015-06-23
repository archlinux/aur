pkgname=cgal-ipelets
pkgver=4.6
pkgrel=1
ipever=7.1.7           # too bad no way to determine this automatically
_pkgid=34705
pkgdesc="Ipelets from CGAL"
arch=('i686' 'x86_64')
url="http://www.cgal.org"
source=(http://gforge.inria.fr/frs/download.php/$_pkgid/CGAL-$pkgver.tar.xz)
depends=('cgal' 'ipe')
makedepends=('cmake' 'boost')
license=('GPL' 'QPL')

build() {
  cd "$srcdir/CGAL-$pkgver"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cd "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets"
  cmake . -DWITH_IPE_7=ON
  make
}

package() {
  mkdir -p "$pkgdir/usr/lib/ipe/$ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/"*.so "$pkgdir/usr/lib/ipe/$ipever/ipelets/"
  cp "$srcdir/CGAL-$pkgver/demo/CGAL_ipelets/lua/"* "$pkgdir/usr/lib/ipe/$ipever/ipelets/"
}
md5sums=('65fa7e17cd654ef68da47df608000007')
