# Maintainer: jxir <aur@jxir.de>

pkgname=tad
pkgver=1.0
pkgrel=1
pkgdesc="Library and tools to handle data arrays in C++"
arch=('x86_64')
url="https://marlam.de/tad/"
license=('MIT')
depends=('ffmpeg' 'gdal' 'hdf5' 'libjpeg'  'libmatio' 'libpng' 'libtiff')
makedepends=('cmake')
source=("https://marlam.de/$pkgname/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('f868b7e23acef78362de4f9773e0dae30c2416faba36bffc10a05f0f91adeb8a')

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
