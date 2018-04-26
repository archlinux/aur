# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapy-uhd-git
pkgver=r62.55da7da
pkgrel=1
pkgdesc="Soapy SDR plugin for UHD supported SDR devices"
arch=(any)
url="https://github.com/pothosware/SoapyUHD"
license=('GPL3')
depends=('boost' 'libuhd' 'soapysdr')
makedepends=('git' 'cmake')
provides=('soapy-uhd')
conflicts=('soapy-uhd')
source=('git+https://github.com/pothosware/SoapyUHD')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/SoapyUHD"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/SoapyUHD/build"
  cd "$srcdir/SoapyUHD/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir/SoapyUHD/build"

  make DESTDIR="$pkgdir" install
}
