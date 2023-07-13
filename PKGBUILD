# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkg=cdi
flavour=
pkgname=${pkg}${flavour}
pkgver=2.2.0
fileID=28692
pkgrel=0
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
sha256sums=('241544f54765c5e1a91170901f65b3665eafbbf184b7fba021686b4dddc8db17')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-netcdf=/usr --with-eccodes=/usr --with-szlib CFLAGS='-g -O2' LIBS='-lpng -lopenjpeg' --enable-iso-c-interface --enable-hirlam-extensions --enable-openmp
  make -j12 || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f $pkgdir/usr/bin/cdi
}
