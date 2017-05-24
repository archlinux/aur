# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkg=cdi
flavour=
pkgname=${pkg}${flavour}
pkgver=1.8.1
fileID=14290
pkgrel=0
pkgdesc="CDI is a general purpose C-library for file IO in the geoscience area. Supported data formats are GRIB, netCDF, SERVICE, EXTRA and IEG. CDI is the IO part of CDO"
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
md5sums=('e06c6643f9c042c2b1f1ea8ed7ce8d7d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-netcdf=/usr --with-grib_api=/usr --with-szlib CFLAGS='-O2 -fopenmp' LDFLAGS='-leccodes' LIBS='-lpng -lopenjpeg'
  make -j12 || return 1
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f $pkgdir/usr/bin/cdi
}
