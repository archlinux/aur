# Maintainer: aksr <aksr at t-com dot me>
pkgname=acme-edit-git
pkgver=r7.4dda137
pkgrel=1
epoch=
pkgdesc="A fuzz file finder/plumber for acme "
arch=('i686' 'x86_64')
url="https://github.com/mariusae/edit"
license=('BSD')
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
_gourl=marius.ae/edit

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
  install -Dm755 bin/edit "$pkgdir/usr/bin/acme-edit"
  install -Dm644 src/${_gourl}/README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

