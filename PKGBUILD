# Maintainer: Areskul <areskul@areskul.com>
pkgname="novops-git"
base="novops"
pkgrel=1
pkgver=0.7.0
pkgdesc="Cross-platform secret manager for development and CI environments"
arch=("any")
url="https://github.com/PierreBeucher/novops/"
license=('LGPL3')
depends=()
makedepends=(git make cargo)
provides=("novops-git")
conflicts=("novops")
source=(git+$url)
md5sums=('SKIP') #autofill using updpkgsums

build() {
  cd $base
  # Checkout to latest tag
  tag=$(git describe --tags --abbrev=0)
  git checkout $tag

  cargo build --release
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
