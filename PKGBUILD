# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=imgcat
pkgdesc="Output images as RGB ANSI graphics on the terminal"
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
url="https://github.com/trashhalo/imgcat"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('efc6a8e894dff5b25b04e0701139db89b6419d484b9e998eca22b1d3d8b10dfc67c8ac88f01d4eadd8f4edd56b25b4fa3e239f4bd79706b1fb36b1e00307672e')

build() {
  cd "$pkgname-$pkgver"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
