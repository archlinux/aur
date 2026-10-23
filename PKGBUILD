# Maintainer: Your Name <you@example.com>
#
# Repackages the official self-contained botmux release binaries (Bun
# single-file executables) from GitHub Releases. Nothing is compiled and
# nothing is written to $HOME. Kept up to date by .github/workflows/update-aur.yml
# (via scripts/update-pkg.sh) -- pkgver and the sha256sums are rewritten by it.

pkgname=botmux-bin
pkgver=3.50.0
pkgrel=1
pkgdesc='Bridge IM chats (Feishu/Lark) to AI coding CLIs (Claude Code, Codex, ...) running in tmux'
arch=('x86_64' 'aarch64')
url='https://github.com/deepcoldy/botmux'
license=('MIT')
depends=('glibc' 'tmux')
optdepends=('claude-code: Claude Code CLI to bridge'
            'openai-codex: OpenAI Codex CLI to bridge'
            'cursor-cli: Cursor Agent CLI (cursor-agent) to bridge')
provides=('botmux')
conflicts=('botmux')
install=botmux-bin.install
# The binary is a Bun "compile" executable: the JS payload is appended to the
# ELF, so stripping it would corrupt/remove the embedded application.
options=('!strip' '!debug')
noextract=("botmux-${pkgver}-x86_64" "botmux-${pkgver}-aarch64")
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/deepcoldy/botmux/v${pkgver}/LICENSE")
source_x86_64=("botmux-${pkgver}-x86_64::https://github.com/deepcoldy/botmux/releases/download/v${pkgver}/botmux-linux-x64")
source_aarch64=("botmux-${pkgver}-aarch64::https://github.com/deepcoldy/botmux/releases/download/v${pkgver}/botmux-linux-arm64")
sha256sums=('7ea5cdd2b6c40102cd99b1bc4b1ca556288b384dd2dffd3f627b323f9baf2be4')
sha256sums_x86_64=('92fa42fdf178984e02b41e17eb658f139d5138fbea740f350cfa3a4f93ee5cdb')
sha256sums_aarch64=('6415d53b3e8d947133299dc6fd0b8504633e3c783031206ffb264ea93c3d87f0')

package() {
  install -Dm755 "${srcdir}/botmux-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/botmux"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
