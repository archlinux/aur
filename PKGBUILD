# Maintainer: Em Zhan <zqianem@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=wgrib2
pkgver=3.0.2
pkgrel=1
pkgdesc="Utility to read and write grib2 files"
arch=('x86_64')
url="https://www.cpc.ncep.noaa.gov/products/wesley/wgrib2/"
license=('GPL' 'custom')
depends=('gcc-libs')
makedepends=('gcc-fortran' 'tar')
source=("https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/$pkgname.tgz.v$pkgver")
noextract=("$pkgname.tgz.v$pkgver")
md5sums=('ab1300f19bb6aca0eb7878de3e1ecf88')

prepare() {
  # workaround bsdtar nonzero exit code: https://bugs.archlinux.org/task/44701
  tar -xf "$pkgname.tgz.v$pkgver"
}

build() {
  cd grib2
  CC=gcc FC=gfortran make
}

package() {
  cd grib2/wgrib2
  install -Dm755 wgrib2 "${pkgdir}/usr/bin/wgrib2"
  install -Dm644 LICENSE-jasper "$pkgdir/usr/share/licenses/$pkgname/LICENSE-jasper"
  install -Dm644 LICENSE-libpng "$pkgdir/usr/share/licenses/$pkgname/LICENSE-libpng"
  install -Dm644 LICENSE-netcdf "$pkgdir/usr/share/licenses/$pkgname/LICENSE-netcdf"
  install -Dm644 LICENSE-wgrib2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-wgrib2"
  install -Dm644 LICENSE-zlib "$pkgdir/usr/share/licenses/$pkgname/LICENSE-zlib"
}
