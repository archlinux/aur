# Maintainer: aksr <aksr at t-com dot me>
pkgname=lsp-git
pkgver=0.2.0.r80.g83465c0
pkgrel=1
epoch=
pkgdesc="Lists files, like ls command, but more human-friendly."
arch=('i686' 'x86_64')
url="https://github.com/dborzov/lsp"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('lsp')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/dborzov/lsp

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  git describe --tags | sed -E 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/lsp "$pkgdir/usr/bin/lsp"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

