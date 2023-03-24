# Maintainer: Areskul <areskul@areskul.com>
pkgname="pipelight-git"
name="pipelight"
pkgrel=1
pkgver=0.2
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
  cd $name
  cargo build --release
}

package() {
  cd $name
  bin="target/release/$name"
  install -Dm755 $bin -t pkg/$name/usr/bin
  install -Dm755 $bin-run -t pkg/$name/usr/bin
  install -Dm755 $bin-trigger -t pkg/$name/usr/bin
}

pkgver() {
  cd $name
  git describe --tags --abbrev=0 | sed s/v//
}
