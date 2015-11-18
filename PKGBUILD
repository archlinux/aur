# Maintainer: aksr <aksr at t-com dot me>
pkgname=kana-git
pkgver=r6.3eb1e80
pkgrel=1
epoch=
pkgdesc="A command to transliterate hiragana and katakana to ASCII."
arch=('i686' 'x86_64')
url="https://github.com/robpike/kana"
license=('BSD')
groups=()
depends=('')
makedepends=('git' 'go>=1.5')
optdepends=()
checkdepends=()
provides=()
conflicts=('kana')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=robpike.io/cmd/kana

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
  install -Dm755 bin/kana "$pkgdir/usr/bin/kana"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/$pkgname/README
}

