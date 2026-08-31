pkgname=commit-ai
pkgver=2.0.4
pkgrel=1
pkgdesc="Cross-platform AI-powered Git commit message generator"
arch=('x86_64' 'aarch64')
url="https://github.com/jhowk14/commit-ai"
license=('MIT')
depends=('git')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jhowk14/commit-ai/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8439c8736e1d9bdeb295f49090932b13673b281a782d781b5718f142d3907975')

build() {
  cd "${pkgname}-${pkgver}"
  CGO_ENABLED=0 go build -trimpath -ldflags '-s -w' -o commit-ai ./cmd/commit-ai
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 commit-ai "$pkgdir/usr/bin/commit-ai"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
