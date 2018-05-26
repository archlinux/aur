# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=soapyosmo
pkgver=0.2.5
_gver=soapy-osmo-$pkgver
pkgrel=1
pkgdesc="SoapySDR plugins for OsmoSDR devices (MiriSDR, RFSpace)"
arch=(any)
url="https://github.com/pothosware/SoapyOsmo"
license=('GPLv3')
depends=('soapysdr' 'gnuradio-osmosdr' 'libmirisdr')
makedepends=('cmake')
provides=('soapyosmo')
conflicts=('soapyosmo')
source=("https://github.com/pothosware/SoapyOsmo/archive/$_gver.tar.gz")
sha256sums=('95a81dbe296e95d928e31e5d7c55aea9acb90740a170caa9d9754f116c94e4d1')

_sdir=SoapyOsmo-$_gver
_bdir=$_sdir/build

build() {
  mkdir -p $srcdir/$_bdir
  cd $srcdir/$_bdir

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $srcdir/$_bdir

  make DESTDIR=$pkgdir install
}
