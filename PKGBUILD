# Maintainer: Em Zhan <zqianem@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=3.7.0
pkgrel=1
pkgdesc="Utility to read and write grib2 files"
arch=('x86_64')
url="https://github.com/NOAA-EMC/wgrib2"
license=('GPL' 'Apache' 'custom')
depends=('netcdf' 'nceplibs-ip' 'nceplibs-g2c')
makedepends=('gcc-fortran' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b741a07710a8195c99a7d50de05bde90182ab4334f5c4a0d6d057c4e20cc6a75')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_IPOLATES=ON -DBLA_VENDOR=OpenBLAS \
    -DUSE_AEC=ON \
    -DUSE_NETCDF=ON \
    -DUSE_G2CLIB_LOW=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$pkgname-$pkgver/wgrib2/LICENSE-wgrib2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
