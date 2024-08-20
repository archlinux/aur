# Maintainer: Em Zhan <zqianem@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=3.4.0
pkgrel=2
pkgdesc="Utility to read and write grib2 files"
arch=('x86_64')
url="https://github.com/NOAA-EMC/wgrib2"
license=('GPL' 'Apache' 'custom')
depends=('netcdf' 'hdf5' 'libaec')
makedepends=('gcc-fortran' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ecbce2209c09bd63f1bca824f58a60aa89db6762603bda7d7d3fa2148b4a0536')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -B build -DUSE_IPOLATES=OFF
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 build/wgrib2/wgrib2 "$pkgdir/usr/bin/$pkgname"
  install -Dm644 wgrib2/LICENSE-wgrib2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
