# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkg=cdi
flavour=
pkgname=${pkg}${flavour}
pkgver=2.1.0
fileID=27452
pkgrel=2
pkgdesc="CDI is a general purpose C-library with an additional Fortran interface for file IO in the geoscience area. Supported data formats are GRIB, netCDF, SERVICE, EXTRA and IEG. CDI is the IO part of CDO"
url="https://code.zmaw.de/projects/cdi"
license=('GPLv2')
depends=('netcdf' 'eccodes' 'libaec' 'openjpeg')
makedepends=('netcdf' 'eccodes' 'libaec' 'openjpeg')
provides=()
conflicts=()
replaces=()
arch=(i686 x86_64)
backup=()
install=
source=(https://code.zmaw.de/attachments/download/${fileID}/${pkg}-${pkgver}.tar.gz)
sha256sums=('b6418ad4fa4a761c401c0bc65f0ef289fdf4f3c4e9bc20f964213cf393d88e93')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-netcdf=/usr --with-eccodes=/usr --with-szlib CFLAGS='-g -O2 -fopenmp' LIBS='-lpng -lopenjpeg' --enable-iso-c-interface
  make -j12 || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f $pkgdir/usr/bin/cdi
}
