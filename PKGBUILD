# Maintainer: jxir <aur@jxir.de>

pkgname=tad
pkgver=2.2
pkgrel=1
pkgdesc="Library and tools to handle data arrays in C++"
arch=('x86_64')
url="https://marlam.de/tad/"
license=('MIT')
depends=('exiv2' 'ffmpeg' 'gdal' 'hdf5' 'libjpeg' 'libmatio' 'libpng' 'libtiff'
         'openexr')
makedepends=('cmake' 'doxygen' 'pandoc')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('c22f26a0c79267dec323e710237db20b5698e1bafac65a4715986ab9fdc37f4d')

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
