# Maintainer: aksr <aksr at t-com dot me>
pkgname=hawk-git
pkgver=r134.f6948cc
pkgrel=1
epoch=
pkgdesc="An Awk clone"
arch=('i686' 'x86_64')
url="https://github.com/mibk/hawk"
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
_gourl=github.com/mibk/hawk

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
  install -D -m755 bin/hawk "$pkgdir/usr/bin/hawk"
  install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

