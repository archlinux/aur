# Maintainer: Jan Baudisch <dev@baudisch.xyz>
pkgname=dallas-git
pkgver=1460109
pkgrel=1
pkgdesc="TI-BASIC compiler written in Go"
arch=("x86_64")
url="https://github.com/Mitchell-Riley/dallas"
license=("unknown")
makedepends=("go")
provides=("dallas")
conflicts=("dallas")
source=("$pkgname::git+https://github.com/Mitchell-Riley/dallas.git")
sha256sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git rev-parse --short HEAD
}

prepare() {
  cd "$pkgname"
  mkdir -p "src/github.com/Mitchell-Riley/dallas"
  mv main.go compiler src/github.com/Mitchell-Riley/dallas/
}

build() {
  cd "$pkgname"
  export GOPATH=$(pwd)
  cd "src/github.com/Mitchell-Riley/dallas"
  go build main.go
}

package() {
  install -Ddm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname/src/github.com/Mitchell-Riley/dallas/main" "$pkgdir/usr/bin/dallas"
}
