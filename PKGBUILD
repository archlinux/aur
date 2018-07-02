# Maintainer: FFY00 <filipe.lains@gmail.com>

pkgname=soapyrtlsdr
pkgver=0.2.5
_gitver=soapy-rtlsdr-$pkgver
pkgrel=1
pkgdesc="SoapySDR RTL-SDR Support Module"
arch=(any)
url="https://github.com/pothosware/SoapyRTLSDR"
license=('MIT')
depends=('soapysdr' 'rtl-sdr')
makedepends=('cmake')
provides=('soapyrtlsdr')
conflicts=('soapyrtlsdr')
source=("$url/archive/$_gitver.tar.gz")
sha256sums=('381a2b5f02444fb1e688b49d742fb54bd5f624b96e710b470203fc4643148c15')

_srcdir=SoapyRTLSDR-$_gitver

build() {
  mkdir -p "$srcdir"/$_srcdir/build
  cd "$srcdir"/$_srcdir/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_srcdir/build

  make DESTDIR="$pkgdir" install
}
