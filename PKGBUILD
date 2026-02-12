# Maintainer: ghsc maintainers
pkgname=ghsc
pkgver=0.0.16
pkgrel=1
pkgdesc="Ultra-short shortcuts for GitHub CLI workflows"
arch=('x86_64' 'aarch64')
url='https://github.com/hassanecoder/ghsc'
license=('MIT')
depends=('git' 'github-cli')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hassanecoder/ghsc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8908d71cb2e95aa0a591200b1e91b2583a0269e2d67ddbad86fb703d9b44fe7c')

build() {
  cd "${srcdir}/ghsc-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags "-s -w" -o ghsc ./cmd/ghsc
}

package() {
  cd "${srcdir}/ghsc-${pkgver}"
  install -Dm755 ghsc "${pkgdir}/usr/bin/ghsc"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
