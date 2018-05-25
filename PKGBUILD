# Maintainer: aksr <aksr at t-com dot me>
pkgname=edwood-git
pkgver=r233.a61b24b
pkgrel=1
epoch=
pkgdesc="Go version of Plan9 Acme Editor "
arch=('i686' 'x86_64')
url="https://github.com/rjkroege/edwood"
license=('BSD 3-Clause')
categories=()
groups=()
depends=('plan9port')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/rjkroege/edwood

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

#check() {
#  GOPATH="$srcdir" go test -v -x ${_gourl}
#}

package() {
  cd "$srcdir"
  install -Dm755 bin/edwood "$pkgdir/usr/bin/edwood"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

