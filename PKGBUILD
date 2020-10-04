# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ali
pkgdesc="Generate HTTP load and plot the results in real-time"
pkgver=0.3.2
pkgrel=1
arch=('x86_64')
url="https://github.com/nakabonne/ali"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('17bd32e031ec6eef473fbc10733a3c1ddbcc30df92d123751f805ba8741632403da6266ea5d968c027a240d04e7eda40dd4e45c1ab511164d924030bd4873056')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm 755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
