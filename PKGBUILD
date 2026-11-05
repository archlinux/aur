# Maintainer: cjber <cjberragan at gmail dot com>
pkgname=kiln-agents-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Native Claude and Codex session launcher with a paired phone client"
arch=('x86_64' 'aarch64')
url="https://github.com/cjber/kiln"
license=('MIT')
depends=('tmux' 'fzf')
optdepends=('libnotify: desktop notifications for input requests and completed turns' 'zoxide: rank the directories offered for new sessions' 'openai-codex: native Codex sessions and cloud discovery')
provides=('kiln' 'kiln-agents')
conflicts=('kiln' 'kiln-agents')
options=('!strip')
source=("kiln-${pkgver}.tar.gz::https://github.com/cjber/kiln/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c20e965f20708499b1a1b2e888ba58b93ee5b46bd42bf6dc7297804f137aa1b1')
source_x86_64=("kiln-linux-x64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-x64")
sha256sums_x86_64=('745daad47cb3256e32c58ec4232647fb6babf772c59437836261969d693b15a8')
source_aarch64=("kiln-linux-arm64-${pkgver}::https://github.com/cjber/kiln/releases/download/v${pkgver}/kiln-linux-arm64")
sha256sums_aarch64=('ae5c593d06fb963d044862a9a88599423f5298fc6754a66e0920c06c108ccf66')

package() {
  local binary=kiln-linux-x64
  if [[ "$CARCH" == aarch64 ]]; then binary=kiln-linux-arm64; fi
  install -Dm755 "$binary-${pkgver}" "${pkgdir}/usr/bin/kiln"
  install -Dm644 "kiln-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "kiln-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
