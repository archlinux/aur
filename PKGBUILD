# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lz4-git
pkgver=1.9.2.r663.gfe389ca
pkgrel=1
pkgdesc="Extremely Fast Compression algorithm"
arch=('i686' 'x86_64')
url="https://lz4.github.io/lz4/"
license=('GPL2' 'BSD')
depends=('glibc')
makedepends=('git')
provides=("lz4=$pkgver")
conflicts=('lz4')
options=('staticlibs')
source=("git+https://github.com/lz4/lz4.git")
sha256sums=('SKIP')


pkgver() {
  cd "lz4"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lz4"

  make
}

check() {
  cd "lz4"

  #make test
}

package() {
  cd "lz4"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 "lib/LICENSE" -t "$pkgdir/usr/share/licenses/lz4"
}
