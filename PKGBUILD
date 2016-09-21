# Maintainer: aksr <aksr at t-com dot me>
pkgname=mk-git
pkgver=r49.73d1b31
pkgrel=1
epoch=
pkgdesc="A reboot of the Plan 9 mk command."
arch=('i686' 'x86_64')
url="https://github.com/dcjones/mk"
license=('')
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
_gourl=github.com/dcjones/mk

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
  install -Dm755 bin/mk "$pkgdir/usr/bin/mk"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

