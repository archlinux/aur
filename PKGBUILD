# Maintainer: Your Name <you@example.com>
#
# Repackages the official self-contained botmux release binaries (Bun
# single-file executables) from GitHub Releases. Nothing is compiled and
# nothing is written to $HOME. Kept up to date by .github/workflows/update-aur.yml
# (via scripts/update-pkg.sh) -- pkgver and the sha256sums are rewritten by it.

pkgname=botmux-bin
pkgver=3.55.0
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
sha256sums_x86_64=('e589b056101862b3ba4224cd6a04a86da773512e50b4d813514e118e60263969')
sha256sums_aarch64=('24f2a1a2cfaefba2854dc290b40fa1639f67a8ea47c198eba927e02c6add6be0')

package() {
  install -Dm755 "${srcdir}/botmux-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/botmux"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
