# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Masoud <mpoloton@gmail.com>
# Contributor: valvetime <valvetimepackages@gmail.com>
# Contributor: Tom Swartz <tom@tswartz.net>

pkgname=soapysdr-git
_pkgname=SoapySDR
pkgver=0.6.1.r83.gd79a09d
pkgrel=1
epoch=3
pkgdesc="Vendor and platform neutral SDR support library"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pothosware/SoapySDR"
license=('Boost')
provides=('soapysdr')
conflicts=('soapysdr')
makedepends=('git' 'cmake')
depends=()
optdependes=('swig: bindings'
	     'python: python bindings'
	     'doxygen: documentation')
source=('git+https://github.com/pothosware/SoapySDR.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long | sed 's/^soapy.sdr-//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
