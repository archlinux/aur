# Maintainer: aksr <aksr at t-com dot me>
pkgname=a-git
pkgver=r378.6d1fd78
pkgrel=1
epoch=
pkgdesc="A text editor inspired by the Sam and Acme text editors for the Plan 9 operating system."
arch=('i686' 'x86_64')
url="https://github.com/as/a"
license=('BSD 3-Clause')
categories=()
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
_gourl=github.com/as/a

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
  install -Dm755 bin/a "$pkgdir/usr/bin/a"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

