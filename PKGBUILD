# Maintainer: Oluf Lorenzen <finkregh at mafia-server dot net>
pkgname=go-fac-git
pkgver=r202.b1d27a1
pkgrel=1
epoch=
pkgdesc="Easy-to-use CUI for fixing git conflicts"
arch=('i686' 'x86_64')
url="https://github.com/mkchoi212/fac"
license=('MIT')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=('go-fac')
conflicts=('go-fac')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/mkchoi212/fac

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
  install -Dm755 bin/fac "$pkgdir/usr/bin/fac"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
