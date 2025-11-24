# Maintainer: Em Zhan <zqianem@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=3.8.0
pkgrel=2
pkgdesc="Utility to read and write grib2 files"
arch=('x86_64')
url="https://github.com/NOAA-EMC/wgrib2"
license=('GPL' 'Apache' 'custom')
depends=('netcdf' 'nceplibs-ip' 'nceplibs-g2c')
makedepends=('gcc-fortran' 'cmake')
conflicts=('wgrib')  # the wgrib binary is also part of this package
source=("$pkgname-$pkgver.tar.gz::https://github.com/NOAA-EMC/wgrib2/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('39faebada36da5457c75f0980bb68fa299b221b3e6b335bb7d29006a35830c54')

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" \
    -DUSE_IPOLATES=ON -DBLA_VENDOR=OpenBLAS \
    -DUSE_NETCDF=ON \
    -DUSE_G2CLIB_LOW=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$pkgname-$pkgver/wgrib2/LICENSE-wgrib2" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
