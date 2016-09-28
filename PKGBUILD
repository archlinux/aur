# Maintainer: aksr <aksr at t-com dot me>
pkgname=bug-git
pkgver=r237.e5ba186
pkgrel=1
epoch=
pkgdesc="Distributed bug tracking with the filesystem and hg or git"
arch=('i686' 'x86_64')
url="https://github.com/driusan/bug"
license=('GPL3')
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
_gourl=github.com/driusan/bug

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
  install -Dm755 bin/bug "$pkgdir/usr/bin/bug"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

