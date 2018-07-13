# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapyuhd
_pkgname=SoapyUHD
pkgver=0.3.4
_gitver=soapy-uhd-$pkgver
pkgrel=1
pkgdesc="Soapy SDR plugin for UHD supported SDR devices"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pothosware/SoapyUHD"
license=('GPL3')
depends=('boost' 'libuhd' 'soapysdr')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz")
sha256sums=('7b7f2bc9a565f42b6e9b0831db942a5231fd048c79976fb2d1f1710efef83dd0')

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
