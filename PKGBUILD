# Maintainer: Dario Pellegrini <pellegrini.dario@gmail.com>

pkgname=cgal5
pkgver=5.3
pkgrel=1
pkgdesc="Computational Geometry Algorithms Library"
arch=('x86_64')
url="https://www.cgal.org"
license=('GPL' 'LGPL')
source=("https://github.com/CGAL/cgal/releases/download/v$pkgver/CGAL-$pkgver.tar.xz")
depends=('mpfr' 'gmp' 'mesa' 'glu' 'boost-libs')
optdepends=('qt5-svg: for CGAL_Qt5'
            'eigen: for some packages, see the CGAL manual')
makedepends=('cmake' 'qt5-svg' 'eigen' 'boost')
replaces=('cgal')
md5sums=('e7358195c1bb7811ff5824607bd456b5')

prepare() {
  mkdir -p "$srcdir/CGAL-$pkgver/build"
  cd "$srcdir/CGAL-$pkgver/build"
  cmake ../ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr 
}

build() {
  echo "CGAL is now header only!"
}

package() {
  cd "$srcdir/CGAL-$pkgver/build"
  make install DESTDIR="$pkgdir"

  # The tarball still has all these licenses included
  for _license in LICENSE{,.BSL,.COMMERCIAL,.GPL,.LGPL,.RFL}; do
    install -D -m644 "$srcdir/CGAL-$pkgver/$_license" "$pkgdir/usr/share/licenses/$pkgname/$_license"
  done
}
