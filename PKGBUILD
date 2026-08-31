pkgname=commit-ai
pkgver=2.0.2
pkgrel=1
pkgdesc="Cross-platform AI-powered Git commit message generator"
arch=('x86_64' 'aarch64')
url="https://github.com/jhowk14/commit-ai"
license=('MIT')
depends=('git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jhowk14/commit-ai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('05cec5d592abde504a684b865145e867692332dd60c3c2ad24922df56d8d6cfb')

build() {
  cd "${pkgname}-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags '-s -w' -o commit-ai ./cmd/commit-ai
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 commit-ai "$pkgdir/usr/bin/commit-ai"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
