# Maintainer: Othavio <obsidianlab3d@gmail.com>
pkgname=agent-bar-bin
pkgver=8.4.0
pkgrel=1
pkgdesc="LLM quota monitor for Waybar (Claude, Codex, Amp, Grok) — standalone binary"
arch=('x86_64')
url="https://github.com/othavi0/agent-bar"
license=('MIT')
provides=('agent-bar') # futureproof for an eventual source-based agent-bar package
conflicts=('agent-bar')
optdepends=('waybar: status bar integration'
            'libnotify: desktop low/critical quota notifications')
# Provider CLIs (claude/codex/amp/grok) are detected at runtime; no canonical AUR
# package names verified, so they are not listed here (see .install).
install="${pkgname}.install"
source=("agent-bar-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/agent-bar-${pkgver}-x86_64.tar.gz")
# Preenchido por release a partir do .sha256 produzido pelo CI. Nunca 'SKIP'.
sha256sums=('895228f5865c5f95a6757b55a05d491fcd53426539d6c9f24668e478316a6fb9')

package() {
  install -Dm755 "${srcdir}/agent-bar" "${pkgdir}/usr/bin/agent-bar"
  install -Dm755 "${srcdir}/scripts/agent-bar-open-terminal" \
    "${pkgdir}/usr/share/agent-bar/scripts/agent-bar-open-terminal"
  for icon in "${srcdir}"/icons/*; do
    install -Dm644 "$icon" "${pkgdir}/usr/share/agent-bar/icons/$(basename "$icon")"
  done
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
