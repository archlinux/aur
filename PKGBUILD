# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe
pkgver=1.2.1
pkgrel=1
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
  cd "$pkgname-$pkgver"

  export CGO_ENABLED=0
  go build -o goxe -ldflags="-s -w -X main.version=v${pkgver}" ./cmd/goxe
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 goxe "${pkgdir}/usr/bin/goxe"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
sha256sums=('3ab6c2419fd0bba18466a8631fb066fa9a27dde2a4160737388ca5c45718bd71')
