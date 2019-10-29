# Maintainer: dianlujitao <dianlujitao at gmail dot com>

_pkgname=efm-langserver
pkgname=$_pkgname-git
pkgver=r41.8718b46
pkgrel=1
pkgdesc="General purpose Language Server"
url="https://github.com/mattn/efm-langserver"
makedepends=('go')
license=('MIT')
arch=('any')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/mattn/efm-langserver.git")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "$srcdir"/src/github.com/mattn
  ln -sf "$srcdir/$_pkgname" "$srcdir"/src/github.com/mattn/efm-langserver
}

build() {
  # Required for go get
  export GOPATH="$srcdir"
  export GOBIN="$srcdir/bin"

  cd "$GOPATH"/src
  go get -v github.com/mattn/efm-langserver
}

package() {
    install -Dm755 "$GOBIN"/efm-langserver $pkgdir/usr/bin/efm-langserver
}
