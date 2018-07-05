# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=1.5.0
pkgrel=1
pkgdesc="Determines out-of-date AUR packages"
arch=('x86_64' 'i686')
url="https://github.com/simon04/aur-out-of-date"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/simon04/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go' 'dep' 'git')

_importpath="github.com/simon04/$pkgname"

prepare() {
  export GOPATH="$srcdir/_go"
  mkdir -p $(dirname "$GOPATH/src/$_importpath")
  ln -sf "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_importpath"
  cd "$GOPATH/src/$_importpath"
  dep ensure
}

check() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath"
  go test $(go list ./...)
}

build() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath"
  go build
}

package() {
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/aur-out-of-date"
}

sha256sums=('a5e9c1321c688b6481569939d97cd8c1516b91e5e139f843323e5bb5701c6754')
