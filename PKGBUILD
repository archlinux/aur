# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapyuhd-git
_pkgname=SoapyUHD
pkgver=0.3.4.r0.55da7da
pkgrel=1
pkgdesc="Soapy SDR plugin for UHD supported SDR devices"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pothosware/SoapyUHD"
license=('GPL3')
depends=('boost' 'libuhd' 'soapysdr')
makedepends=('git' 'cmake')
provides=('soapyuhd')
conflicts=('soapyuhd')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long --tags | sed 's/soapy-uhd-//g;s/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

build() {
  mkdir -p "$srcdir"/$_pkgname/build
  cd "$srcdir"/$_pkgname/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_pkgname/build

  make DESTDIR="$pkgdir" install
}
