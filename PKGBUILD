# Maintainer: Your Name <you@example.com>
#
# Repackages the official self-contained botmux release binaries (Bun
# single-file executables) from GitHub Releases. Nothing is compiled and
# nothing is written to $HOME. Kept up to date by .github/workflows/update-aur.yml
# (via scripts/update-pkg.sh) -- pkgver and the sha256sums are rewritten by it.

pkgname=botmux-bin
pkgver=3.59.31
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
sha256sums_x86_64=('efe55e4f3c3076b97da24bf7b927cb4bcd5d61d356df67d65641b735d04e0ea3')
sha256sums_aarch64=('91b53256291b3204b06a80129d6483bd10264e3aa7b6cfb9ffc3908e4e47c984')

package() {
  install -Dm755 "${srcdir}/botmux-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/botmux"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
