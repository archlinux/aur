# Maintainer: Lewis Wynne <lew@ily.rs>

pkgname=pda
pkgver=2025.47
pkgrel=1
pkgdesc="personal digital assistant! a key-value store with rich template support"
arch=('x86_64')
url="https://github.com/llywelwyn/$pkgname"
license=('MIT')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
options=('!debug' 'strip')
sha256sums=('807adc9642c631f7a7ca6e611231019ecbb491ce0fe6baf0eb82ec2de2dd0934')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath"
  ldflags="-s -w -X 'main.version=$pkgver'"
  go build -o "$pkgname" -ldflags="$ldflags" .
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

