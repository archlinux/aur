# Maintainer: Areskul <areskul@areskul.com>
pkgname="pipelight-git"
base="pipelight"
pkgrel=1
pkgver=0.4.26
pkgdesc="A Rust based quick automation tool"
arch=("any")
url="https://gitea.com/pipelight/pipelight.git"
license=('GPL2')
depends=(deno)
makedepends=(git make cargo)
provides=("pipelight")
conflicts=("pipelight")
source=(git+$url)
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd $base
  cargo build --release
}

package() {
  cd $base
  bin="target/release/$base"
  install -Dm755 $bin -t $pkgdir/usr/bin
  install -Dm755 $bin-run -t $pkgdir/usr/bin
  install -Dm755 $bin-trigger -t $pkgdir/usr/bin
}

pkgver() {
  cd $base
  git describe --tags --abbrev=0 | sed s/v//
}
