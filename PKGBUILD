# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=caire
pkgver=1.0.1
pkgrel=1
pkgdesc="Content aware image resize library based on Seam Carving"
arch=('x86_64' 'i686')
url="https://github.com/esimov/caire"
license=('MIT')
source=("https://github.com/esimov/$pkgname/archive/v$pkgver.tar.gz")
makedepends=('go')

_importpath="github.com/esimov/$pkgname"

prepare() {
  export GOPATH="$srcdir/_go"
  mkdir -p $(dirname "$GOPATH/src/$_importpath")
  ln -sf "$srcdir/$pkgname-$pkgver" "$GOPATH/src/$_importpath"
  cd "$GOPATH/src/$_importpath"
  go get -t ./...
}

build() {
  cd "$GOPATH/src/$_importpath/cmd/$pkgname"
  go build
}

package() {
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$GOPATH/src/$_importpath/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 "$GOPATH/src/$_importpath/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('a37f8d46359b75dbe474635c4cd7354538e1be4744c292c756000fb669a3c5de')
