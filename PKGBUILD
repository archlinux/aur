pkgname=franz-agent
pkgver=0.1.0
pkgrel=1
pkgdesc='A powerful terminal-based AI assistant for developers.'
arch=('x86_64' 'aarch64')
url='https://github.com/marang/franz-agent'
license=('custom:FSL-1.1-MIT')
depends=()
makedepends=('go' 'git')
source=("-.tar.gz::https://github.com/marang/franz-agent/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('1bfb7ef4f5662ae5bfd67e08f046d6686bfe3e14861073c913fbca53c3039e8e')

build() {
  cd "-"
  export CGO_ENABLED=0
  export GOEXPERIMENT=greenteagc
  go build -trimpath -ldflags "-s -w -X github.com/marang/franz-agent/internal/version.Version=v" .
}

package() {
  cd "-"
  install -Dm755 "./franz-agent" "/usr/bin/franz-agent"
  install -Dm644 "./LICENSE.md" "/usr/share/licenses/franz-agent/LICENSE.md"
  install -Dm644 "./README.md" "/usr/share/doc/franz-agent/README.md"
}
