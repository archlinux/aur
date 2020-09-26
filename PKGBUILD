# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=ali
pkgdesc="Generate HTTP load and plot the results in real-time"
pkgver=0.2.5
pkgrel=1
arch=('x86_64')
url="https://github.com/nakabonne/ali"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('9ae768b2c830f1e302882161ac1498892e18abb12c4208733543e9934e7a95935e4fc8369d4296264025169c8292adfe230a6c1c948aab276aa8eec9ecbd0a74')

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
