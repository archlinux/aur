# Maintainer: aksr <aksr at t-com dot me>
pkgname=fzz-git
pkgver=r207.055e067
pkgrel=1
epoch=
pkgdesc="Change the input of a single command interactively"
arch=('i686' 'x86_64')
url="https://github.com/mrnugget/fzz"
license=('MIT')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('fzz')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/mrnugget/fzz

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
  install -Dm755 bin/fzz "$pkgdir/usr/bin/fzz"
  install -Dm644 src/${_gourl}/man/fzz.1 $pkgdir/usr/share/man/man1/fzz.1
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README
}

