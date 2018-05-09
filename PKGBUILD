# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkg=cdi
flavour=
pkgname=${pkg}${flavour}
pkgver=1.9.4
fileID=17327
pkgrel=0
pkgdesc="CDI is a general purpose C-library with an additional Fortran interface for file IO in the geoscience area. Supported data formats are GRIB, netCDF, SERVICE, EXTRA and IEG. CDI is the IO part of CDO"
url="https://code.zmaw.de/projects/cdi"
license=('GPLv2')
depends=('netcdf' 'eccodes' 'libaec')
makedepends=('netcdf' 'eccodes' 'libaec')
provides=()
conflicts=()
replaces=()
arch=(i686 x86_64)
backup=()
install=
source=(https://code.zmaw.de/attachments/download/${fileID}/${pkg}-${pkgver}.tar.gz)
md5sums=('e5bb0e67367482f23e8e8e05b33950e8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-netcdf=/usr --with-eccodes=/usr --with-szlib CFLAGS='-O2 -fopenmp' LIBS='-lpng -lopenjpeg'
  make -j12 || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f $pkgdir/usr/bin/cdi
}
