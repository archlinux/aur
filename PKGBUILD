# Maintainer: Arfad <arfadmuzali258@gmail.com>
pkgname=restui
pkgver=1.3.0
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
sha256sums=('869859c943175d7ff52ca9f6ff0ad0cfa092e32a82c2db9d9ad549c6f95fce1c')

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

