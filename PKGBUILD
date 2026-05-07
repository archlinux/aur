# Maintainer: Dan Finlay <namelessdan@gmail.com>
pkgname=unfold
pkgver=0.1.1
pkgrel=1
pkgdesc="Flatpak wrapper that shows app permissions before install/update"
arch=('x86_64' 'aarch64')
url="https://github.com/danfinlay/unfold"
license=('MIT')
depends=('flatpak')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e4ff24c394d83597ab66a2b996197dba2d9a84722feefdf4071c36d5338aa6a')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w" -o "$pkgname" ./cmd/unfold
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 scripts/unfold-shim.sh "$pkgdir/usr/share/$pkgname/unfold-shim.sh"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
