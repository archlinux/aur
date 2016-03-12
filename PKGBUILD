# Maintainer: aksr <aksr at t-com dot me>
pkgname=go-sed-git
pkgver=r62.2a10cff
pkgrel=1
epoch=
pkgdesc="An implementation of sed in Go."
arch=('i686' 'x86_64')
url="https://github.com/waywardcode/sed"
license=('BSD')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('go-sed')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/waywardcode/sed/cmd/go-sed

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/go-sed "$pkgdir/usr/bin/go-sed"
  cd src/${_gourl}
  cd ../../
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

