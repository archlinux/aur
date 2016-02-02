# Maintainer: aksr <aksr at t-com dot me>
pkgname=freq-git
pkgver=r8.1b93e11
pkgrel=1
epoch=
pkgdesc="Command to show character (Unicode code point) frequency."
arch=('i686' 'x86_64')
url="https://github.com/robpike/freq"
license=('BSD')
groups=()
depends=('')
makedepends=('git' 'go>=1.5')
optdepends=()
checkdepends=()
provides=()
conflicts=('freq')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=robpike.io/cmd/freq

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
  install -Dm755 bin/freq "$pkgdir/usr/bin/freq"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

