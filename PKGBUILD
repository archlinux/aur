# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapyrtlsdr
_pkgname=SoapyRTLSDR
pkgver=0.2.5
_gitver=soapy-rtlsdr-$pkgver
pkgrel=1
pkgdesc="SoapySDR RTL-SDR Support Module"
arch=(any)
url="https://github.com/pothosware/SoapyRTLSDR"
license=('MIT')
depends=('soapysdr' 'rtl-sdr')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz")
sha256sums=('381a2b5f02444fb1e688b49d742fb54bd5f624b96e710b470203fc4643148c15')

build() {
  mkdir -p "$srcdir"/$_pkgname-$_gitver/build
  cd "$srcdir"/$_pkgname-$_gitver/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_pkgname-$_gitver/build

  make DESTDIR="$pkgdir" install
}
