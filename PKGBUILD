pkgname=franz-agent
pkgver=0.1.2
pkgrel=1
pkgdesc='A powerful terminal-based AI assistant for developers.'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/franz-agent'
license=('custom:FSL-1.1-MIT')
depends=()
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marang/franz-agent/archive/refs/tags/v0.1.2.tar.gz")
sha256sums=('12c7bad34870898ac9faf9b44d3a8f8367ead856ecb5a0ca2436d894c977fe2c')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  export GOEXPERIMENT=greenteagc
  go build -trimpath -ldflags "-s -w -X github.com/marang/franz-agent/internal/version.Version=v${pkgver}" .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "./franz-agent" "${pkgdir}/usr/bin/franz-agent"
  install -Dm644 "./LICENSE.md" "${pkgdir}/usr/share/licenses/franz-agent/LICENSE.md"
  install -Dm644 "./README.md" "${pkgdir}/usr/share/doc/franz-agent/README.md"
}
