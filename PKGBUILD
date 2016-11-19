# Maintainer: Mateusz Paluszkiewicz <aifam96 at gmail.com>

_pkgname=liblogicalaccess
pkgname=${_pkgname}-git
pkgver=1.85.0.r4.d539d93
pkgrel=1
pkgdesc="C++ RFID / NFC Library for Windows/Linux/Mac. For PC/SC, NFC, ISO compliant and proprietary hardware"
arch=('any')
url="http://liblogicalaccess.islog.com"
license=('LGPL')
depends=('pcsclite' 'boost-libs' 'openssl')
makedepends=('cmake' 'boost')
provides=('liblogicalaccess')
conflicts=('liblogicalaccess')
source=("git+https://github.com/islog/liblogicalaccess.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git describe --tags | sed 's/-/.r/; s/-g/./'
}

prepare() {
	cd "$srcdir/${_pkgname}"
  mkdir -p build

  cd "$srcdir/${_pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=MinSizeRel  ..
}

build() {
	cd "$srcdir/${_pkgname}/build"
	make all
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make install
}