# Maintainer: aksr <aksr at t-com dot me>
pkgname=watch-git
pkgver=r52.bea3ea6
pkgrel=1
epoch=
pkgdesc="Watches for changes in a directory tree and reruns a command in an acme win or just on the terminal."
arch=('i686' 'x86_64')
url="https://github.com/eaburns/Watch"
license=('unknown')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=()
conflicts=('watch')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/eaburns/Watch

pkgver() {
  GOPATH="$srcdir" go get -d ${_gourl}
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  cd "$srcdir"
  install -Dm755 bin/Watch "$pkgdir/usr/bin/Watch"
  install -Dm644 src/${_gourl}/README.md $pkgdir/usr/share/doc/$pkgname/README
}

