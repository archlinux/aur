# Maintainer: aksr <aksr at t-com dot me>
pkgname=jump-git
pkgver=r303.8252c37
pkgrel=1
epoch=
pkgdesc="Quick and fuzzy directory jumper."
arch=('i686' 'x86_64')
url="https://github.com/gsamokovarov/jump"
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
_gourl=github.com/gsamokovarov/jump

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
  install -Dm755 bin/jump "$pkgdir/usr/bin/jump"
  install -Dm644 src/${_gourl}/man/jump.1 $pkgdir/usr/share/man/man1/jump.1
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE.txt $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

