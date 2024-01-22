# Maintainer: Areskul <areskul@areskul.com>
pkgname="pipelight-git"
base="pipelight"
pkgrel=1
pkgver=0.7.20
pkgdesc="A Rust based quick automation tool"
arch=("any")
url="https://gitea.com/pipelight/pipelight.git"
license=('GPL2')
depends=(deno watchexec)
makedepends=(git make cargo)
provides=("pipelight-git")
conflicts=("pipelight")
source=(git+$url)
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd $base
  # Checkout to latest tag
  tag=$(git describe --tags --abbrev=0)
  git checkout $tag

  cargo build --release
}

pre-install() {
  # Var Log folder
  mkdir -p /var/log/pipelight
}


package() {
  # Install the only binary
  cd $base
  bin="target/release/$base"
  install -Dm755 $bin -t $pkgdir/usr/bin
}

pkgver() {
  cd $base
  git describe --tags --abbrev=0 | sed s/v//
}
