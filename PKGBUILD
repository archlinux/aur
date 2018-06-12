# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=caire
pkgver=1.1.0
pkgrel=1
pkgdesc="Content aware image resize library based on Seam Carving"
arch=('x86_64' 'i686')
url="https://github.com/esimov/caire"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/esimov/$pkgname/archive/v$pkgver.tar.gz")
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

sha256sums=('1398a3fdce1839df4a3094dfab1eadc03e1dac321f45395c3617685669750522')
