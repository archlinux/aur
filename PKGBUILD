# Maintainer: Karasowl <https://github.com/Karasowl>
#
# Official steipete/CodexBar CLI binary for Linux. Provides the `codexbar`
# command used by kodexbar-suite as the per-provider quota backend for
# Codex, Grok, and Antigravity.
#
# The AUR name `codexbar` belongs to an unrelated Waybar widget
# (mryll/codexbar) that also installs /usr/bin/codexbar, so this package
# uses codexbar-cli-bin and conflicts with that foreign package.

pkgname=codexbar-cli-bin
pkgver=0.45.2
pkgrel=1
pkgdesc='CodexBar CLI (official binary): AI provider usage quotas backend used by kodexbar-suite'
arch=('x86_64' 'aarch64')
url='https://github.com/steipete/CodexBar'
license=('MIT')
depends=('curl' 'sqlite' 'gcc-libs')
provides=('codexbar-cli')
conflicts=('codexbar')
# Swift release binary: keep the upstream-built image intact.
options=(!strip)
# Flat release tarball at root: CodexBarCLI (real binary), codexbar -> CodexBarCLI
# (symlink), VERSION (read next to the realpath of the executable for --version).
# Install the binary + VERSION under /usr/lib and expose /usr/bin/codexbar.
source_x86_64=("CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz::https://github.com/steipete/CodexBar/releases/download/v${pkgver}/CodexBarCLI-v${pkgver}-linux-aarch64.tar.gz")
source=("LICENSE::https://raw.githubusercontent.com/steipete/CodexBar/v${pkgver}/LICENSE")
sha256sums_x86_64=('f5ca9e5bbe511493902bd8fd7d2c409c9b4800259967284a05a73627156a5f2e')
sha256sums_aarch64=('d5635c9e5b7524ecd4aa91d0de30a3c18f3c9d1fcaa3920187a6d6c7f3b8bbc0')
sha256sums=('14293556b79940745123d0160c71d27ed0e9fe9b8a848093f3ed78f4853caafe')

package() {
  local libdir="${pkgdir}/usr/lib/${pkgname}"
  install -Dm755 "${srcdir}/CodexBarCLI" "${libdir}/CodexBarCLI"
  install -Dm644 "${srcdir}/VERSION" "${libdir}/VERSION"
  install -d "${pkgdir}/usr/bin"
  ln -s "../lib/${pkgname}/CodexBarCLI" "${pkgdir}/usr/bin/codexbar"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
