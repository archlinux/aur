# Maintainer: aksr <aksr at t-com dot me>
pkgname=de-git
pkgver=r124.6c2e418
pkgrel=1
epoch=
pkgdesc="A Programmer's Text Editor"
arch=('i686' 'x86_64')
url="https://github.com/driusan/de"
license=('MIT')
categories=()
groups=()
depends=('')
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
_gourl=github.com/driusan/de

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
  install -Dm755 bin/de "$pkgdir/usr/bin/de"
  install -Dm644 src/${_gourl}/COMMANDS.md $pkgdir/usr/share/doc/${pkgname%-*}/COMMANDS.md
  install -Dm644 src/${_gourl}/PLUGINS.md $pkgdir/usr/share/doc/${pkgname%-*}/PLUGINS.md
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/USAGE.md $pkgdir/usr/share/doc/${pkgname%-*}/USAGE.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

