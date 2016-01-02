# Maintainer: aksr <aksr at t-com dot me>
pkgname=gitbrute-git
pkgver=r10.f734e6f
pkgrel=1
epoch=
pkgdesc="Brute-force a git commit hash"
arch=('i686' 'x86_64')
url="https://github.com/bradfitz/gitbrute"
license=('unknown')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
provides=('gitbrute')
conflicts=('gitbrute')
replaces=()
backup=()
options=()
changelog=
install=
noextract=()
_gourl=github.com/bradfitz/gitbrute

pkgver() {
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
  install -Dm755 bin/gitbrute "$pkgdir/usr/bin/gitbrute"
  install -Dm644 src/${_gourl}/README $pkgdir/usr/share/doc/$pkgname/README
}

