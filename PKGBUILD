# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=god
pkgver=1.9
pkgrel=1
pkgdesc="Utility for simplifying the Git usage"
arch=('x86_64')
url="https://github.com/orhun/god"
license=('GPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a950dc788e806f94b2f0ad12b0d0964c8ea771a18cba551173e304de783d8ed5b6b0fd9efd7fc51ac86510f7117de655e18ce88a8896e455dbc7c157bbf15b1a')

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
}
