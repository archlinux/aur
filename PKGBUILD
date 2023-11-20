# Maintainer: Maxim Logaev <maximlogaev2001ezro@gmail.com>

pkgname=zasm-git
_name=zasm
pkgver=4.4.13.r0.gb91d51d
pkgrel=1
pkgdesc='Z80/8080/Z180 assembler'
arch=('any')
url="https://k1.spdns.de/Develop/Projects/zasm/Distributions/"
license=('BSD')
provides=('zasm')
depends=('zlib')
makedepends=('git')
conflicts=('zasm')

source=("git+https://github.com/Megatokio/zasm")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_name
  git submodule init
  git submodule update
}

build() {
  cd $_name
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $_name/zasm $pkgdir/usr/bin/zasm
}
