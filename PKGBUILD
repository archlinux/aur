# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=aur-out-of-date
pkgver=0.8.0
pkgrel=1
pkgdesc="Determines out-of-date AUR packages"
arch=('x86_64' 'i686')
url="https://github.com/simon04/aur-out-of-date"
license=('GPL')
source=("https://github.com/simon04/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go' 'dep')

_importpath="github.com/simon04/$pkgname"

prepare() {
  export GOPATH="$srcdir/_go"
  mkdir -p $(dirname "$GOPATH/src/$_importpath")
  ln -sf "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_importpath"
  cd "$GOPATH/src/$_importpath"
  dep ensure
}

check() {
  cd "$GOPATH/src/$_importpath"
  go test $(go list ./...)
}

build() {
  cd "$GOPATH/src/$_importpath"
  go build
}

package() {
  cd "$GOPATH/src/$_importpath"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "$pkgname" "$pkgdir/usr/bin/aur-out-of-date"
}

sha256sums=('ac32e361183cf2c517ee33d8d74e42347dfb6c98d17bf670c73f7269dcbf83e0')
