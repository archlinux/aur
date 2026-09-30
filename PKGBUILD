# Maintainer: cjber <cjberragan at gmail dot com>
pkgname=kiln-agents-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Vim-style overview of every Claude, Codex and Pi session on the machine"
arch=('x86_64' 'aarch64')
url="https://github.com/cjber/kiln"
license=('MIT')
depends=('tmux' 'fzf')
optdepends=('libnotify: desktop notifications when agent turns finish' 'zoxide: rank the directories offered for new sessions' 'kitty: jump to agents running in other kitty windows' 'claude-code: Claude sessions' 'openai-codex: Codex sessions')
provides=('kiln' 'kiln-agents')
conflicts=('kiln' 'kiln-agents')
options=('!strip')
source=("kiln-${pkgver}.tar.gz::https://github.com/cjber/kiln/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7fcc3f1f25db3ff9b128f1e04a62b718cc8f20b0f04a9bd6bf0515b4b98e4b6e')
source_x86_64=("kiln-linux-x64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-x64")
sha256sums_x86_64=('3d951e41588f8b291db9427b5fa4e2f099867e411cf63820055e1fc2dd0c2987')
source_aarch64=("kiln-linux-arm64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-arm64")
sha256sums_aarch64=('d1c3c9cfe9e8b69162873680b79ea8c6a8a895fde8fe62c08a518db04cd57d74')

package() {
  local binary=kiln-linux-x64
  if [[ "$CARCH" == aarch64 ]]; then binary=kiln-linux-arm64; fi
  install -Dm755 "$binary-${pkgver}" "${pkgdir}/usr/bin/kiln"
  install -Dm644 "kiln-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "kiln-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
