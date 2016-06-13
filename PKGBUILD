pkgname='solvespace'
pkgver=2.1
pkgrel=1
pkgdesc="SOLVESPACE is a parametric 3d CAD program."
arch=('i686' 'x86_64')
url='http://solvespace.com/'
license=('GPL3')
depends=('libpng' 'json-c' 'glew' 'gtkmm' 'zlib' 'freetype2' 'fontconfig')
makedepends=('git' 'cmake')
source=("https://github.com/solvespace/solvespace/archive/v2.1.tar.gz"
        "https://github.com/solvespace/libdxfrw/archive/master.zip"
        "v2.1.patch")
md5sums=('e9b070c7dc41c3d79547507376734f01'
         'SKIP'
         '7cc547028bf896e4748403c1a16199e3')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch < "$srcdir/v2.1.patch"
  cd "$srcdir/$pkgname-$pkgver/extlib"
  rmdir libdxfrw
  ln -s ../../libdxfrw-master libdxfrw
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir" install
}
