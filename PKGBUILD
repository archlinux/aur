# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xxhash-git
pkgver=0.6.0.r51.gd9e2c7b
pkgrel=1
pkgdesc="Extremely fast non-cryptographic hash algorithm"
arch=('i686' 'x86_64')
url="https://cyan4973.github.io/xxHash/"
license=('BSD')
depends=('glibc')
makedepends=('git')
checkdepends=('valgrind')
provides=('xxhash')
conflicts=('xxhash')
source=("git+https://github.com/Cyan4973/xxHash.git")
sha256sums=('SKIP')


pkgver() {
  cd "xxHash"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "xxHash"

  make
}

check() {
  cd "xxHash"

  #make test
}

package() {
  cd "xxHash"

  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/xxhash/LICENSE"
}
