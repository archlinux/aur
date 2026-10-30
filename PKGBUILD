# Maintainer: agony <27015 at riseup dot net>

pkgname=merman-bin
_pkgname=merman
pkgver=0.9.3
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
sha256sums_x86_64=('e93dbf741319190d53107c4277b373d357dcdad3f4f7e50f114a51c9b682109b'
                   '6be41a75fcd4acde7aa133b23ce0110ea39703a9791acbb0643f05d062bd25aa')
sha256sums_aarch64=('afea2472d232d0642b430f1db03a8d216925fbad04144348c2fe0838069c7f54'
                    'a4e1c25c71875463ed89c38844f24343c34a13d64e9f8ce01c125e1f14181b67')

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
