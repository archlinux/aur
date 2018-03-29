# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=1.1.0
pkgrel=1
pkgdesc="Determines out-of-date AUR packages"
arch=('x86_64' 'i686')
url="https://github.com/simon04/aur-out-of-date"
license=('GPL')
source=("https://github.com/simon04/$pkgname/archive/v$pkgver.tar.gz")
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

sha256sums=('47e9b52e143c2a7e44862d5cab2893f6d01d0a9f605eeae44c05a10b6b6846ee')
