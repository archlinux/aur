# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libcap-ng-git
pkgver=0.7.9.r14.g360ef9c
pkgrel=1
pkgdesc="Library for Linux that makes using posix capabilities easy"
arch=('i686' 'x86_64')
url="https://people.redhat.com/sgrubb/libcap-ng/"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('git')
provides=('libcap-ng')
conflicts=('libcap-ng')
options=('staticlibs')
source=("git+https://github.com/stevegrubb/libcap-ng.git")
sha256sums=('SKIP')


pkgver() {
  cd "libcap-ng"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libcap-ng"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "libcap-ng"

  make check
}

package() {
  cd "libcap-ng"

  make DESTDIR="$pkgdir" install
}
