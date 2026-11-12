# Maintainer: agony <27015 at riseup dot net>

pkgname=merman-bin
_pkgname=merman
pkgver=0.10.0
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
sha256sums_x86_64=('f0273090f6c0973793139365bbe496035d1e89cd5bd514663ceaffb3d4f00926'
                   '4028b5f4f954af84d5b890813518bad10e42db6302cdbe6107e2365c3b4e0292')
sha256sums_aarch64=('5481cfebf8b642d77e9924d001330b6eb3a1cf75fb7f56aa1cd8f01115d76223'
                    '242fef3f8e81921b19001e9bf7753827bba774e539197a3053f3e8cb711c8747')

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
