# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libunistring-git
pkgver=0.9.8.r3.g66423d1
pkgrel=1
pkgdesc="A library provides functions for manipulating Unicode strings and for manipulating C strings"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/libunistring/"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'gperf' 'wget')
provides=('libunistring')
conflicts=('libunistring')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/libunistring.git")
sha256sums=('SKIP')


pkgver() {
  cd "libunistring"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libunistring"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libunistring"

  make check
}

package() {
  cd "libunistring"

  make DESTDIR="$pkgdir" install
}
