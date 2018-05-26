# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=soapyrtlsdr
pkgver=0.2.5
_gver=soapy-rtlsdr-$pkgver
pkgrel=1
pkgdesc="SoapySDR RTL-SDR Support Module"
arch=(any)
url="https://github.com/pothosware/SoapyRTLSDR"
license=('MIT')
depends=('soapysdr' 'rtl-sdr')
makedepends=('cmake')
provides=('soapyrtlsdr')
conflicts=('soapyrtlsdr')
source=("https://github.com/pothosware/SoapyRTLSDR/archive/$_gver.tar.gz")
sha256sums=('381a2b5f02444fb1e688b49d742fb54bd5f624b96e710b470203fc4643148c15')

_sdir=SoapyRTLSDR-$_gver
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

  install -dm 644 $pkgdir/usr/share/licenses/$pkgname
  install -Dm 644 $srcdir/$_sdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/
}
