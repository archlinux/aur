# Maintainer: cjber <cjberragan at gmail dot com>
pkgname=kiln-agents-bin
pkgver=0.1.2
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
sha256sums=('1e83bb11e67d0983be72a8976953e51faaee4397b0e49675f32bd1fe3e860e0d')
source_x86_64=("kiln-linux-x64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-x64")
sha256sums_x86_64=('ac9a734988d83673ef9404f80ad6762685bab32abdd33bd1b92f8047431f1800')
source_aarch64=("kiln-linux-arm64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-arm64")
sha256sums_aarch64=('e30ced255178ecc9a8633e85d2ba0265cf0089448f1757b79cb1b1151158344f')

package() {
  local binary=kiln-linux-x64
  if [[ "$CARCH" == aarch64 ]]; then binary=kiln-linux-arm64; fi
  install -Dm755 "$binary-${pkgver}" "${pkgdir}/usr/bin/kiln"
  install -Dm644 "kiln-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "kiln-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
