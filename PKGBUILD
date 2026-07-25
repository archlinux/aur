# Maintainer: Illia Zavadzkyi <i68281124@gmail.com>
pkgname=fastaur
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, Go-powered AUR helper with parallel RPC queries and mandatory PKGBUILD review"
arch=('x86_64' 'aarch64')
url="https://github.com/user14923929/fastaur"
license=('GPL3')
depends=('pacman' 'git' 'base-devel' 'sudo')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/user14923929/fastaur/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('069e87a996f730840d7574a67c6ca3c019e08312a7787996799508b43bca98e9')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build -ldflags "-s -w -X main.version=$pkgver" -o fastaur ./cmd/fastaur
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 fastaur "$pkgdir/usr/bin/fastaur"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
