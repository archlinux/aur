# Maintainer: agony <27015 at riseup dot net>

pkgname=merman-bin
_pkgname=merman
pkgver=0.9.2
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
sha256sums_x86_64=('7e33156646127bcd7794e7fd36cf76a7d19b501f77f945a186b98394a3451c55'
                   '740ecbd11ee880982279ea12e3e757a0d191e0d9c7aa2896f8e0845272e31f5a')
sha256sums_aarch64=('d412ca2786a36b9625e65794586d23100b30544c187af21c5a40ec0e9c522328'
                    'b8a6b55a55d5df1fb2739ef8bfafc2dcddc5692aa1380a9db85f4576174b3d8f')

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
