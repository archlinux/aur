# Maintainer: jxir <aur@jxir.de>

pkgname=tad
pkgver=2.1
pkgrel=1
pkgdesc="Library and tools to handle data arrays in C++"
arch=('x86_64')
url="https://marlam.de/tad/"
license=('MIT')
depends=('exiv2' 'ffmpeg' 'gdal' 'hdf5' 'libjpeg' 'libmatio' 'libpng' 'libtiff'
         'openexr')
makedepends=('cmake' 'doxygen' 'pandoc')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('58e1107027166d43aa62a6a3159e1174b929d13d23f59318e59a2c81ad7ce0a9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
