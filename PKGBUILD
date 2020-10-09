# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=god
pkgver=1.10
pkgrel=1
pkgdesc="Utility for simplifying the Git usage"
arch=('x86_64')
url="https://github.com/orhun/god"
license=('GPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a1071f7fe4c9a3e705bd72e4dfd3a112483761a7cbe994d2f0896f8e14c3c4a74445d584b6ebd8daf0847af110a7808d56032534c29c3cda3b8dbe7b79d10c39')

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
