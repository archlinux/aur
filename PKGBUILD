# Maintainer: Arfad <arfadmuzali258@gmail.com>
pkgname=restui
pkgver=1.3.3
pkgrel=1
pkgdesc="Terminal UI API client for testing HTTP requests"
arch=('any')
url="https://github.com/arfadmuzali/restui"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('restui')
conflicts=('restui')

source=("https://github.com/arfadmuzali/restui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33cffa8c40807c46585eb7602b83167dcf53ff6437929def4704b6e1127e5c93')

build() {
  cd "$pkgname-$pkgver"
  export CGO_ENABLED=0
  go build \
    -trimpath \
    -ldflags "-s -w -X github.com/arfadmuzali/restui/internal/version.Version=v$pkgver" \
    -o restui
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 restui "$pkgdir/usr/bin/restui"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

