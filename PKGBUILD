# Maintainer: cjber <cjberragan at gmail dot com>
pkgname=kiln-agents-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Vim-style overview of every Claude, Codex and Pi session on the machine"
arch=('x86_64' 'aarch64')
url="https://github.com/cjber/kiln"
license=('MIT')
depends=('tmux' 'fzf')
optdepends=('zoxide: rank the directories offered for new sessions' 'kitty: jump to agents running in other kitty windows' 'claude-code: Claude sessions' 'openai-codex: Codex sessions')
provides=('kiln' 'kiln-agents')
conflicts=('kiln' 'kiln-agents')
options=('!strip')
source=("kiln-${pkgver}.tar.gz::https://github.com/cjber/kiln/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29b1b7408908fa4aab697846717ebc102b1027e2c408842d278870a418be61e2')
source_x86_64=("kiln-linux-x64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-x64")
sha256sums_x86_64=('70087871aef5ba7c409e203625c2e3a65517d2f6bc2d94b3c85519efe0d1e79f')
source_aarch64=("kiln-linux-arm64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-arm64")
sha256sums_aarch64=('47c0fe9e7197051edacaa95aabf902a0ab8fb5921a3435a0fba0617d1f46aaa8')

package() {
  local binary=kiln-linux-x64
  if [[ "$CARCH" == aarch64 ]]; then binary=kiln-linux-arm64; fi
  install -Dm755 "$binary-${pkgver}" "${pkgdir}/usr/bin/kiln"
  install -Dm644 "kiln-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "kiln-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
