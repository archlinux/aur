# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=bctoolbox-git
_pkgname=bctoolbox
pkgver=4.4.0.alpha.r3.gbded30c
pkgrel=1
pkgdesc="Utilities library for Belledonne Communications software"
arch=('x86_64')
url="http://www.linphone.org/"
license=('GPL')
conflicts=('bctoolbox')
provides=('bctoolbox=$pkgver')
depends=('bcunit>=3.0.2+12' 'libdecaf' 'mbedtls')
makedepends=('cmake' 'git')
source=("git+https://github.com/BelledonneCommunications/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build
  cmake -DENABLE_TESTS_COMPONENT=NO \
      -DCMAKE_INSTALL_PREFIX="/usr" \
      -DENABLE_STATIC="NO" \
      -DENABLE_TESTS="YES" \
      -DENABLE_TESTS_COMPONENT="YES" ../"${_pkgname}"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
