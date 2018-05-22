# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=1.3.0
pkgrel=2
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

sha256sums=('7be5c86348f92f977edf38a65b46aedaf4bc01f9b298b477829411dceb9ff473')
