pkgname=uni
pkgver=1.0.0
pkgrel=3
pkgdesc='Query the Unicode database from the commandline, with good support for emojis'
arch=('x86_64')
repo="github.com/arp242/$pkgname"
url="https://$repo"
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('04edf69aca7b086328fa1a7bd8e06617ba074eaec041eda6bdad7a1ba0a00dee')

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
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
