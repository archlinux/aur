# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=botan-git
pkgver=3.0.0.rc1.r31.g70d06e464
pkgrel=1
pkgdesc="Cryptography library written in C++"
arch=('i686' 'x86_64')
url="https://botan.randombit.net/"
license=('BSD')
depends=('glibc' 'zlib')
makedepends=('git' 'python')
provides=("botan=$pkgver")
conflicts=('botan')
options=('staticlibs')
source=("git+https://github.com/randombit/botan.git")
sha256sums=('SKIP')


pkgver() {
  cd "botan"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "botan"

  ./configure.py \
    --prefix="/usr" \
    --with-zlib
  make
}

check() {
  cd "botan"

  ./botan-test
}

package() {
  cd "botan"

  make DESTDIR="$pkgdir" install
  install -Dm644 "license.txt" -t "$pkgdir/usr/share/licenses/botan"
}
