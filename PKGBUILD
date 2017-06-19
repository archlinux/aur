# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lz4-git
pkgver=1.7.4.2.r221.g89b9f02
pkgrel=2
pkgdesc="Extremely Fast Compression algorithm"
arch=('i686' 'x86_64')
url="https://lz4.github.io/lz4/"
license=('GPL2' 'BSD')
depends=('glibc')
makedepends=('git')
provides=('lz4')
conflicts=('lz4')
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

  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 "lib/LICENSE" "$pkgdir/usr/share/licenses/lz4/LICENSE"
}
