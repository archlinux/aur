# Maintainer: jxir <aur@jxir.de>

pkgname=tad
pkgver=1.3
pkgrel=1
pkgdesc="Library and tools to handle data arrays in C++"
arch=('x86_64')
url="https://marlam.de/tad/"
license=('MIT')
depends=('exiv2' 'ffmpeg' 'gdal' 'hdf5' 'libjpeg' 'libmatio' 'libpng' 'libtiff'
         'openexr')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('eaf2052289de9eeaa60efcd6123523bd1bd40faa3651c1bb35c351d6d5b7aa80')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
