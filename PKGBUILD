# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=goawk
pkgver=1.6.1
pkgrel=1
pkgdesc="AWK interpreter written in go"
url="https://github.com/benhoyt/goawk"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('go-pie' 'glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cc2bfd094950b8a67cd022b11095752a059d59efe57ccd64a0e3fc80238f8cb0')

build() {
  cd "$pkgname-$pkgver"
    go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o "$pkgname" .
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname"    "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
