# Maintainer: ghsc maintainers
pkgname=ghsc
pkgver=0.0.17
pkgrel=1
pkgdesc="Ultra-short shortcuts for GitHub CLI workflows"
arch=('x86_64' 'aarch64')
url='https://github.com/hassanecoder/ghsc'
license=('MIT')
depends=('git' 'github-cli')
makedepends=('go')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hassanecoder/ghsc/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12074360483b0d6034838a5a49a7a42443c22fe63bbdc066b5e1c28150f5330f')

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
