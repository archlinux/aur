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
sha256sums=('95edc8e46a844b1359167110b708a8a779298a1d853bf03ea71db478830eefac')

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
