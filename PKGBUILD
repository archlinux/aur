# Maintainer: datsfilipe <contact@datsfilipe.xyz>

pkgname=trxsh
pkgver=1.0.4
pkgrel=1
pkgdesc="Trxsh - A better trash-cli, built in Go."
arch=('x86_64')
url="https://github.com/datsfilipe/trxsh"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b7e572d1626559fbfa68227fe388c63af4f2b63dc9300d5e3cb93ab6457b1f3f')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o "$pkgname" ./cmd/main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
