# Maintainer: aksr <aksr at t-com dot me>
pkgname=gomacro-git
pkgver=r1115.4f667f8
pkgrel=1
epoch=
pkgdesc="Interactive Go interpreter and debugger with REPL, Eval, generics and Lisp-like macros"
arch=('i686' 'x86_64')
url="https://github.com/cosmos72/gomacro"
license=('MPL2')
groups=()
depends=()
makedepends=('git' 'go>=1.9')
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
_gourl=github.com/cosmos72/gomacro

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
  install -D -m755 bin/gomacro "$pkgdir/usr/bin/gomacro"
  install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

