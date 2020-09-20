# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=kbtui
pkgdesc="Keybase TUI written in Go"
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url="https://github.com/Rudi9719/kbtui"
license=('GPL3')
makedepends=('git' 'go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('de520f9be01e237eb5401f2705badd6c5a41f297e8bf705538b7221fb403b46d582f6af7b9a78d57382a15128e457dd2f4c03dbf48259fa216932ba823a416d6')

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
  install -Dm 644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
