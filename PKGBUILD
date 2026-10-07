# Maintainer: Fabrice Aneche <akh@inair.space>

pkgname=vduck
pkgver=1.2.4
pkgrel=1
pkgdesc="Terminal UI to browse and query DuckDB databases and data files"
arch=('x86_64' 'aarch64')
url="https://github.com/akhenakh/vduck"
license=('MIT')
makedepends=('go' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/akhenakh/vduck/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34ac434b50370226a406cfb66b5c0b47e44be4984646ddaa45cf9d494e4fbd68')

build() {
  cd "$pkgname-$pkgver"
  # DuckDB is linked through duckdb-go-bindings' prebuilt static library.
  export CGO_ENABLED=1
  go build -trimpath -buildvcs=false -ldflags "-s -w" -o vduck .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 vduck "$pkgdir/usr/bin/vduck"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
