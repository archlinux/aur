# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xxhash-git
pkgver=0.7.4.r542.gf4bef92
pkgrel=1
pkgdesc="Extremely fast non-cryptographic hash algorithm"
arch=('i686' 'x86_64')
url="https://cyan4973.github.io/xxHash/"
license=('BSD')
depends=('glibc')
makedepends=('git')
checkdepends=('valgrind')
provides=("xxhash=$pkgver")
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

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/xxhash"
}
