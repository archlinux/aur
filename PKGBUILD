# Maintainer: cjber <cjberragan at gmail dot com>
pkgname=kiln-agents-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="ACP conversations for Claude, Codex and Pi with a paired phone client"
arch=('x86_64' 'aarch64')
url="https://github.com/cjber/kiln"
license=('MIT')
depends=('tmux' 'fzf' 'util-linux')
optdepends=('libnotify: desktop notifications for input requests and completed turns' 'zoxide: rank the directories offered for new sessions' 'nodejs: run the npm ACP adapters' 'npm: install the Claude, Codex and Pi ACP adapters' 'openai-codex: read-only Codex Cloud discovery')
provides=('kiln' 'kiln-agents')
conflicts=('kiln' 'kiln-agents')
options=('!strip')
source=("kiln-${pkgver}.tar.gz::https://github.com/cjber/kiln/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3f1a56921593e07a6dc3c510e364bd03260a55168999a55aadc6f0d28c06c27b')
source_x86_64=("kiln-linux-x64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-x64")
sha256sums_x86_64=('80ebf1787926f70aa7c984fbca617c55a66ccdb59daa5b69b5c31be599ef804b')
source_aarch64=("kiln-linux-arm64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-arm64")
sha256sums_aarch64=('bd55e69f2c3da0325168f5853bd4c9ddf4ed327754f9d4627179d597eb75308a')

package() {
  local binary=kiln-linux-x64
  if [[ "$CARCH" == aarch64 ]]; then binary=kiln-linux-arm64; fi
  install -Dm755 "$binary-${pkgver}" "${pkgdir}/usr/bin/kiln"
  install -Dm644 "kiln-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "kiln-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
