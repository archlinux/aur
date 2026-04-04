# Maintainer: Your Name <your.email@example.com>
# Contributor: Contributor Name <contributor@example.com>

pkgname=neter
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful network utility tool written in Go, supporting TCP/UDP/Unix socket communication"
arch=('x86_64' 'aarch64')
url="https://github.com/ischenyu/neter"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.26')
options=('!strip' 'staticlibs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ischenyu/neter/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Build with optimizations and version info
  go build \
    -ldflags="-s -w -X main.version=${pkgver}" \
    -o neter \
    .
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Run tests
  go test -v -race ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install binary
  install -Dm755 neter "${pkgdir}/usr/bin/neter"
  
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 README_zh.md "${pkgdir}/usr/share/doc/${pkgname}/README_zh.md"
}
