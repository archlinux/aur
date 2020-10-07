# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Contributor: Joost Bremmer <joost@madeofmagicandwires.online>
# https://github.com/orhun/pkgbuilds

pkgname=pkgtop
pkgdesc="Interactive package manager & resource monitor"
pkgver=2.4
pkgrel=1
arch=('x86_64')
url="https://github.com/orhun/pkgtop"
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('35ae09a150f49adf4f86056f44b2c104be0904828ae1d2c83c0644dc6fd948864b5acd7ec1fe1972af82075c30be9c8568c5c122e13ee3e15a505f25b51e3f4c')

build() {
  cd "$pkgname-$pkgver/src"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$pkgname-$pkgver/src"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 "../README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
