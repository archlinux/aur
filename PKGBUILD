# Maintainer: aksr <aksr at t-com dot me>
pkgname=strings-git
pkgver=r9.c455a79
pkgrel=1
epoch=
pkgdesc="A custom, Unicode-competent version of the BSD strings utility."
arch=('i686' 'x86_64')
url="https://github.com/robpike/strings"
license=('BSD')
groups=()
depends=('')
makedepends=('git' 'go>=1.5')
optdepends=()
checkdepends=()
provides=()
conflicts=('strings')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=robpike.io/cmd/strings

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
  install -Dm755 bin/strings "$pkgdir/usr/bin/cmd/strings"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/$pkgname/README
}

