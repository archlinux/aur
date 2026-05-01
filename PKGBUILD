pkgname=franz-agent
pkgver=0.1.1
pkgrel=1
pkgdesc='A powerful terminal-based AI assistant for developers.'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/franz-agent'
license=('custom:FSL-1.1-MIT')
depends=()
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/marang/franz-agent/archive/refs/tags/v0.1.1.tar.gz")
sha256sums=('1f0d82dcca6feae80428e850ad5521d2efd8f49f5135620c9936b89d06326d17')

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
