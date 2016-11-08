# Maintainer: Sebastian Jug <seb AT stianj DOT ug>

pkgname=hypercli-git
_pkgname=hypercli
pkgver=r22214.6fe5465
pkgrel=1
pkgdesc="Hyper.sh CLI client"
arch=('x86_64' 'i686')
url="https://github.com/hyperhq/hypercli"
conflicts=('hypercli')
provides=('hypercli')
options=('!strip')
license=('Apache')
makedepends=('go' 'git')
source=('git+https://github.com/hyperhq/hypercli.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"
  export GOPATH="$srcdir"
  mkdir -p "$GOPATH/src/github.com/hyperhq"
  mv "$_pkgname" "$GOPATH/src/github.com/hyperhq"
  cd "$GOPATH/src/github.com/hyperhq/$_pkgname"
  sh build.sh
}

package() {
  cd "$GOPATH/src/github.com/hyperhq/$_pkgname/hyper"
  install -Dm755 hyper "$pkgdir/usr/bin/hyper"
}

