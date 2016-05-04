# Maintainer: aksr <aksr at t-com dot me>
pkgname=watchgopher-git
pkgver=r80.2ea7166
pkgrel=1
epoch=
pkgdesc="Watch a directory for changes"
arch=('i686' 'x86_64')
url="https://github.com/mrnugget/watchgopher"
license=('MIT')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('watchgopher')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/mrnugget/watchgopher

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
  install -Dm755 bin/watchgopher "$pkgdir/usr/bin/watchgopher"
  install -Dm644 src/${_gourl}/LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  cp -r src/${_gourl}/examples $pkgdir/usr/share/doc/${pkgname%-*}/
}

