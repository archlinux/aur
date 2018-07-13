# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=soapyosmo
_pkgname=SoapyOsmo
pkgver=0.2.5
_gitver=soapy-osmo-$pkgver
pkgrel=1
pkgdesc="SoapySDR plugins for OsmoSDR devices (MiriSDR, RFSpace)"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pothosware/SoapyOsmo"
license=('GPL3')
depends=('soapysdr' 'gnuradio-osmosdr' 'libmirisdr')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitver.tar.gz")
sha256sums=('95a81dbe296e95d928e31e5d7c55aea9acb90740a170caa9d9754f116c94e4d1')

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
