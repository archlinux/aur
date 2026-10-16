# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream was renamed from llm to yak in v0.3.7 (config migrates
# ~/.llm -> ~/.yak automatically on first run).

pkgname=rust-yak-bin
_pkgname=yak
pkgver=0.4.6
pkgrel=1
pkgdesc='A plugin-based harness for LLMs in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/imjiaoyuan/yak'
license=('MIT')
depends=()
provides=("${_pkgname}=${pkgver}")
conflicts=('yak' 'yak-bin' 'yak-git' 'rust-yak' 'rust-llm' 'rust-llm-bin')
options=('!strip' '!debug')
source=(
    "LICENSE::https://raw.githubusercontent.com/imjiaoyuan/yak/main/LICENSE"
)
source_x86_64=(
    "${_pkgname}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/yak-x86_64-unknown-linux-musl.tar.gz"
)
source_aarch64=(
    "${_pkgname}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/yak-aarch64-unknown-linux-musl.tar.gz"
)
sha256sums=('b0adbc31ae0c3ab64ae21504359ba5e70f29886a559c99a79fb5cba762de670c')
sha256sums_x86_64=('8ba60e8b32f40e7f90d2d30822442be63e83376f444213c70b3e56807a1f8d00')
sha256sums_aarch64=('6d334bda709aa1dc85db7de85a23c52ad393c608460d09406b4f2a170e30f5da')

# Upstream ships a static-pie (musl) single binary, so there are no runtime
# shared-library dependencies and no build step. The release tarball contains
# one file (yak); the LICENSE is fetched separately from the repo.

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
