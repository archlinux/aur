# Maintainer: cjber <cjberragan at gmail dot com>
pkgname=kiln-agents-bin
pkgver=0.3.0
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
sha256sums=('28d54375d0bd2952237b9df9ab0740f2803da5936c224c60822d18593cb46e76')
source_x86_64=("kiln-linux-x64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-x64")
sha256sums_x86_64=('fee47452d6bfffe4e46d47e04ecf98f249eeec7499f460150abe7fffd1b1ee81')
source_aarch64=("kiln-linux-arm64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-arm64")
sha256sums_aarch64=('af1ea4873859ac84000914171deab3457cda0daa61fed0978685600fa4f2db8b')

package() {
  local binary=kiln-linux-x64
  if [[ "$CARCH" == aarch64 ]]; then binary=kiln-linux-arm64; fi
  install -Dm755 "$binary-${pkgver}" "${pkgdir}/usr/bin/kiln"
  install -Dm644 "kiln-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "kiln-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
