# Maintainer: aksr <aksr at t-com dot me>
pkgname=s-git
pkgver=r373.bce10d1
pkgrel=1
epoch=
pkgdesc="Open a web search in your terminal."
arch=('i686' 'x86_64')
url="https://github.com/zquestz/s"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('s')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/zquestz/s

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
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
  install -Dm755 bin/s "$pkgdir/usr/bin/s"
  install -Dm644 $srcdir/src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 $srcdir/src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

