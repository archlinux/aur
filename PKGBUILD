# Maintainer: Ralf Mueller <stark.dreamdetective@gmail.com>
# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkgname=cdo
pkgver=2.3.0
fileID=29019
pkgrel=0
pkgdesc="Command line tool manipulate and analyse Climate model Data. Supported data formats are GRIB, netCDF, SERVICE, EXTRA and IEG."
url="https://code.zmaw.de/projects/cdo"
license=('BSD')
depends=('netcdf' 'hdf5' 'proj' 'libaec' 'eccodes' 'udunits' 'fftw' 'curl' 'jasper' 'magics++')
makedepends=('netcdf' 'hdf5' 'proj' 'libaec' 'eccodes' 'udunits' 'fftw' 'curl' 'jasper' 'magics++')
provides=()
conflicts=()
replaces=()
arch=(i686 x86_64)
backup=()
install=
source=(https://code.zmaw.de/attachments/download/${fileID}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('10c878227baf718a6917837527d4426c2d0022cfac4457c65155b9c57f091f6b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --with-netcdf=/usr \
    --with-udunits2=/usr \
    --with-hdf5=/usr \
    --with-szlib=/usr \
    --with-proj=/usr \
    --with-fftw3 \
    --with-curl=/usr \
    --with-eccodes=/usr \
    --with-magics=/usr \
    --with-libxml2=/usr \
    --enable-openmp \
    CFLAGS="-g -O3 -Wall" \
    CXXFLAGS="-g -O3 -Wall"

  make -j12 || return
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -f $pkgdir/bin/cdotest
}
