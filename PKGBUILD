# Maintainer: aksr <aksr at t-com dot me>
pkgname=sed-go-git
pkgver=r76.906bc69
pkgrel=1
epoch=
pkgdesc="An implementation of sed in Go. Just because! "
arch=('i686' 'x86_64')
url="https://github.com/rwtodd/Go.Sed"
license=('GPL3')
categories=()
groups=()
depends=()
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
_gourl=github.com/rwtodd/Go.Sed/cmd/sed-go

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/sed-go "$pkgdir/usr/bin/sed-go"
  install -Dm644 src/${_gourl}/../../README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/../../LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

