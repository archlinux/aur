# Maintainer: aksr <aksr at t-com dot me>
pkgname=go-scc-git
pkgver=r702.48187ef
pkgrel=1
epoch=
pkgdesc="A very fast accurate code counter with complexity calculations and COCOMO estimates."
arch=('i686' 'x86_64')
url="https://github.com/boyter/scc/"
license=('MIT' 'UNLICENSE')
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
_gourl=github.com/boyter/scc/

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
  install -D -m755 bin/scc "$pkgdir/usr/bin/scc"
  install -D -m644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -D -m644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

