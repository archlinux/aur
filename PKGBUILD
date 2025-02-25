# Maintainer: Em Zhan <zqianem@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=3.6.0
pkgrel=1
pkgdesc="Utility to read and write grib2 files"
arch=('x86_64')
url="https://github.com/NOAA-EMC/wgrib2"
license=('GPL' 'Apache' 'custom')
depends=('netcdf' 'nceplibs-ip' 'nceplibs-g2c')
makedepends=('gcc-fortran' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('55913cb58f2b329759de17f5a84dd97ad1844d7a93956d245ec94f4264d802be')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_IPOLATES=ON -DBLA_VENDOR=OpenBLAS \
    -DUSE_AEC=ON \
    -DUSE_NETCDF=ON \
    -DUSE_OPENJPEG=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$pkgname-$pkgver/wgrib2/LICENSE-wgrib2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
