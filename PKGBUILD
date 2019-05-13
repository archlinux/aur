# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Anton Kudryavtsev <boblobl4@gmail.com>

pkgname=mbedtls-git
pkgver=2.17.0.r258.g75d9a333c
pkgrel=1
pkgdesc="An open source, portable, easy to use, readable and flexible SSL library"
arch=('i686' 'x86_64')
url="https://tls.mbed.org/"
license=('apache')
depends=('glibc')
makedepends=('git')
checkdepends=('python2')
provides=('mbedtls' 'polarssl')
conflicts=('mbedtls' 'polarssl')
options=('staticlibs')
source=("git+https://github.com/ARMmbed/mbedtls.git")
sha256sums=('SKIP')


prepare() {
  cd "mbedtls"

  # enable flags for non-embedded systems
  sed -i 's|//\(#define MBEDTLS_THREADING_C\)|\1|' "include/mbedtls/config.h"
  sed -i 's|//\(#define MBEDTLS_THREADING_PTHREAD\)|\1|' "include/mbedtls/config.h"
}

pkgver() {
  cd "mbedtls"

  git describe --long --tags | sed 's/^mbedtls-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "mbedtls"

  make SHARED=1 no_test
}

check() {
  cd "mbedtls"

  make SHARED=1 check
}

package() {
  cd "mbedtls"

  make DESTDIR="$pkgdir/usr" install
}
