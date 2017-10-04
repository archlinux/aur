# Maintainer: aksr <aksr at t-com dot me>
pkgname=nex-git
pkgver=r112.542279e
pkgrel=1
epoch=
pkgdesc="A lexer similar to Lex/Flex, generates Go code, integrates with Go's yacc, supports UTF-8 and nested structural regular expressions."
arch=('i686' 'x86_64')
url="https://github.com/blynn/nex"
license=('GPLv3')
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
_gourl=github.com/blynn/nex

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

check() {
  cd "$srcdir/src/${_gourl}"
  #make test
}

package() {
  cd "$srcdir"
  install -Dm755 bin/nex "$pkgdir/usr/bin/nex"
  install -Dm644 src/${_gourl}/README.asciidoc $pkgdir/usr/share/doc/${pkgname%-*}/README.asciidoc
  install -Dm644 src/${_gourl}/COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}

