# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkg=cdi
flavour=
pkgname=${pkg}${flavour}
pkgver=2.3.0
fileID=29020
pkgrel=1
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
sha256sums=('fff47c8eac38ec2e0f47715aadcbc1343b166aa017f0466019e73c4a53a323a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-netcdf=/usr --with-eccodes=/usr --with-szlib CFLAGS='-g -O2' --enable-iso-c-interface --enable-hirlam-extensions --enable-openmp
  make -j12 || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f $pkgdir/usr/bin/cdi
}
