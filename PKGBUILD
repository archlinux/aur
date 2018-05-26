# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapyuhd-git
pkgver=0.3.4.r0.55da7da
pkgrel=1
pkgdesc="Soapy SDR plugin for UHD supported SDR devices"
arch=(any)
url="https://github.com/pothosware/SoapyUHD"
license=('GPL3')
depends=('boost' 'libuhd' 'soapysdr')
makedepends=('git' 'cmake')
provides=('soapyuhd')
conflicts=('soapyuhd')
source=('git+https://github.com/pothosware/SoapyUHD')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/SoapyUHD
  git describe --long --tags | sed 's/soapy-uhd-//g;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  mkdir -p $srcdir/SoapyUHD/build
  cd $srcdir/SoapyUHD/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd $srcdir/SoapyUHD/build

  make DESTDIR=$pkgdir install
}
