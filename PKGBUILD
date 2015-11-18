# Maintainer: aksr <aksr at t-com dot me>
pkgname=now-git
pkgver=r11.334176d
pkgrel=1
epoch=
pkgdesc="Convenient global date printer"
arch=('i686' 'x86_64')
url="https://github.com/robpike/now"
license=('BSD')
groups=()
depends=('')
makedepends=('git' 'go>=1.5')
optdepends=()
checkdepends=()
provides=()
conflicts=('now')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=robpike.io/cmd/now

pkgver() {
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
  install -Dm755 bin/now "$pkgdir/usr/bin/now"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

