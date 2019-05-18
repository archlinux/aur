# Maintainer: aksr <aksr at t-com dot me>
pkgname=dupl-git
pkgver=r109.28d787e
pkgrel=1
epoch=
pkgdesc="A tool for code clone detection."
arch=('i686' 'x86_64')
url="https://github.com/mibk/dupl"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/mibk/dupl

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
  install -D -m755 bin/dupl "$pkgdir/usr/bin/dupl"
  install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

