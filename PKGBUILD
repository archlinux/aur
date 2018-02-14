# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=caire
pkgver=1.0.2
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

sha256sums=('f075ee4b3d12f94b987dc44972ead28693fa622ad8326fd58d91a7628012d45c')
