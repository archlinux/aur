# Maintainer: aksr <aksr at t-com dot me>
pkgname=machma-git
pkgver=r59.241878f
pkgrel=1
epoch=
pkgdesc="Easy parallel execution of commands with live feedback"
arch=('i686' 'x86_64')
url="https://github.com/fd0/machma"
license=('BSD')
categories=()
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/fd0/machma

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/machma "$pkgdir/usr/bin/machma"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

