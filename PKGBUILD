# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: fatalis <fatalis@fatalis.pw>

pkgname=lzbench-git
pkgver=1.8.1.r56.g609d783
pkgrel=1
pkgdesc="An in-memory benchmark of open-source compressors"
arch=('i686' 'x86_64')
url="https://github.com/inikep/lzbench"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
provides=("lzbench=$pkgver")
conflicts=('lzbench')
source=("git+https://github.com/inikep/lzbench.git")
sha256sums=('SKIP')


prepare() {
  cd "lzbench"

  sed -i 's/LDFLAGS	+= -lrt -static/LDFLAGS	+= -lrt/' "Makefile"
}

pkgver() {
  cd "lzbench"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lzbench"

  make
}

package() {
  cd "lzbench"

  install -Dm755 "lzbench" -t "$pkgdir/usr/bin"
}
