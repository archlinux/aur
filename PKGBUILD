# Maintainer: aksr <aksr at t-com dot me>
pkgname=sift-git
pkgver=r70.2ca9471
pkgrel=1
epoch=
pkgdesc="A fast and powerful open source alternative to grep."
arch=('i686' 'x86_64')
url="https://github.com/svent/sift"
url="https://sift-tool.org/"
license=('GPLv3')
categories=()
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('sift' 'sift-bin')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/svent/sift

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
  install -Dm755 bin/sift "$pkgdir/usr/bin/sift"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

