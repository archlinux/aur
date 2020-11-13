# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=imgcat
pkgdesc="Output images as RGB ANSI graphics on the terminal"
pkgver=1.2.0
pkgrel=2
arch=('x86_64')
url="https://github.com/trashhalo/imgcat"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('712ad518e9145613eba2f87816f5dd217bbb0782941818f68fbaf929feddd5d2b915123481dca868cc09855333064101f752e2903f00278a68f8a88c092c89b7')

build() {
  cd "$pkgname-$pkgver/cmd/$pkgname"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver/cmd/$pkgname"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "../../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 "../../LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
