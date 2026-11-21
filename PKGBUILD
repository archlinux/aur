# Maintainer: agony <27015 at riseup dot net>

pkgname=merman-bin
_pkgname=merman
pkgver=0.11.0
pkgrel=1
pkgdesc='Mermaid.js, but headless, in Rust (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/Latias94/merman'
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_release="${url}/releases/download/v${pkgver}"
source_x86_64=("merman-cli-${pkgver}-x86_64.tar.xz::${_release}/merman-cli-x86_64-unknown-linux-gnu.tar.xz"
               "merman-lsp-${pkgver}-x86_64.tar.xz::${_release}/merman-lsp-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("merman-cli-${pkgver}-aarch64.tar.xz::${_release}/merman-cli-aarch64-unknown-linux-gnu.tar.xz"
                "merman-lsp-${pkgver}-aarch64.tar.xz::${_release}/merman-lsp-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('cb51eae6818fb1e6f14ef469ea0b2a67b560c345bf3065513d24f640fa3334b2'
                   'fae1375abbab9d4c26f74e6515ccfba678f3652bef8b3318dfb3aaa0980107d9')
sha256sums_aarch64=('5bdbdedd91e8aafd4127ea996bccb5d25052e8a49098d8fca903e00f1d60781f'
                    '35f196c4e0281fef74238039e4f9e9839f53764a325015f5b38884742eebb552')

package() {
  local cli="merman-cli-${CARCH}-unknown-linux-gnu"
  local lsp="merman-lsp-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${cli}/merman-cli" "${lsp}/merman-lsp" -t "${pkgdir}/usr/bin"
  install -Dm644 "${cli}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${cli}/completions/merman-cli.bash" "${pkgdir}/usr/share/bash-completion/completions/merman-cli"
  install -Dm644 "${cli}/completions/merman-cli.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "${cli}/completions/_merman-cli" -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm644 "${cli}"/man/*.1 -t "${pkgdir}/usr/share/man/man1"
}
