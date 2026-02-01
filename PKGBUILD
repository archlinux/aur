# Maintainer: Dylan Marcano <nxusdev@protonmail.com>
pkgname=goxe
pkgver=1.1.1
pkgrel=3
pkgdesc="Is a log reduction tool that normalizes, filters, and aggregates repeated messages to reduce noise and storage."
arch=('x86_64' 'aarch64')
options=('!debug')
url="https://github.com/DumbNoxx/Goxe"
license=('Apache-2.0')
makedepends=('go')
source=("Goxe-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
  cd "Goxe-$pkgver"

  export CGO_ENABLED=0
  go build -o goxe -ldflags="-s -w -X main.version=v${pkgver}" ./cmd/goxe
}

package() {
  cd "Goxe-$pkgver"
  install -Dm755 goxe "${pkgdir}/usr/bin/goxe"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
sha256sums=('46954a89afea5c3bc1e99caf6298fced345fe4416d1937d8b8171793bc24052b')
