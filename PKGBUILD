# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=caire
pkgver=1.1.1
pkgrel=2
pkgdesc="Content aware image resize library based on Seam Carving"
arch=('x86_64' 'i686')
url="https://github.com/esimov/caire"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/esimov/$pkgname/archive/$pkgver.tar.gz")
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
  export GOPATH="$srcdir/_go"
  cd "$GOPATH/src/$_importpath/cmd/$pkgname"
  go build
}

package() {
  export GOPATH="$srcdir/_go"
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 "$GOPATH/src/$_importpath/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 "$GOPATH/src/$_importpath/cmd/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('cfb409c7e8cd4807b6a8861daa05b06be2ae21df58bf46220b6ba63e1e1f9181')
