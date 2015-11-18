# Maintainer: aksr <aksr at t-com dot me>
pkgname=hira-git
pkgver=r13.3eb60dc
pkgrel=1
epoch=
pkgdesc="A command to transliterate ASCII to Hiragana."
arch=('i686' 'x86_64')
url="https://github.com/robpike/hira"
license=('BSD')
groups=()
depends=('')
makedepends=('git' 'go>=1.5')
optdepends=()
checkdepends=()
provides=()
conflicts=('hira')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=robpike.io/cmd/hira

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
  install -Dm755 bin/hira "$pkgdir/usr/bin/hira"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/$pkgname/README
}

