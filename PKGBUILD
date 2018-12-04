# Maintainer: aksr <aksr at t-com dot me>
pkgname=ivy-git
pkgver=r306.3dd8a2d
pkgrel=1
epoch=
pkgdesc="An APL-like calculator."
arch=('i686' 'x86_64')
url="https://github.com/robpike/ivy"
license=('BSD')
groups=()
depends=()
makedepends=('git' 'go>=1.5')
optdepends=()
checkdepends=()
provides=()
conflicts=('ivy')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=robpike.io/ivy

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

#check() {
#  GOPATH="$srcdir" go test -v -x ${_gourl}
#}

package() {
  cd "$srcdir"
  install -Dm755 bin/ivy "$pkgdir/usr/bin/ivy"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  sed '7,285!d' $srcdir/src/${_gourl}/doc.go > README
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}

