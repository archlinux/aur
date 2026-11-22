# Maintainer: ldgnu <ldgnu@users.noreply.github.com>
pkgname=openaula
pkgver=0.1.9
pkgrel=1
pkgdesc="TUI, CLI y API para configurar el teclado AULA/Epomaker F108 Pro en Linux"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/ldgnu/openaula"
license=('MIT')
depends=()
makedepends=('go')
conflicts=("${pkgname}-bin")
provides=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a01d3a16713f4543e9e114434fa233a473fa7ac876310ce01a88583f625788b1')

build() {
  cd "${srcdir}/openaula-${pkgver}"
  export CGO_ENABLED=0
  export GOFLAGS="-mod=mod"
  go build -trimpath -ldflags "-s -w" -o openaula ./cmd/openaula
}

package() {
  cd "${srcdir}/openaula-${pkgver}"
  install -Dm755 openaula "${pkgdir}/usr/bin/openaula"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 NOTICE.md "${pkgdir}/usr/share/doc/${pkgname}/NOTICE.md"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 packaging/udev/99-openaula.rules \
    "${pkgdir}/usr/lib/udev/rules.d/99-openaula.rules"
}
