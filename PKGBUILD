pkgname=commit-ai
pkgver=2.0.3
pkgrel=1
pkgdesc="Cross-platform AI-powered Git commit message generator"
arch=('x86_64' 'aarch64')
url="https://github.com/jhowk14/commit-ai"
license=('MIT')
depends=('git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jhowk14/commit-ai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6168502d38ea52d7f6e6a7c4173ad87171ff930ea16122d5cf2fa57632dc0729')

build() {
  cd "${pkgname}-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags '-s -w' -o commit-ai ./cmd/commit-ai
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 commit-ai "$pkgdir/usr/bin/commit-ai"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
