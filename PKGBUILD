# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=rust-llm-bin
_pkgname=llm
pkgver=0.1.3
pkgrel=1
pkgdesc='Terminal-first AI hub in Rust for prompting, chat, templates, embeddings and dev workflows'
arch=('x86_64' 'aarch64')
url='https://github.com/imjiaoyuan/llm'
license=('MIT')
depends=()
provides=("${_pkgname}=${pkgver}")
conflicts=('llm' 'llm-bin' 'llm-git' 'rust-llm')
options=('!strip' '!debug')
source=(
    "LICENSE::https://raw.githubusercontent.com/imjiaoyuan/llm/main/LICENSE"
)
source_x86_64=(
    "llm-x86_64.tar.gz::${url}/releases/download/v${pkgver}/llm-x86_64-unknown-linux-musl.tar.gz"
)
source_aarch64=(
    "llm-aarch64.tar.gz::${url}/releases/download/v${pkgver}/llm-aarch64-unknown-linux-musl.tar.gz"
)
sha256sums=('b0adbc31ae0c3ab64ae21504359ba5e70f29886a559c99a79fb5cba762de670c')
sha256sums_x86_64=('be0045560cc19f2088cc6676226af7014801194b7cd10ff78917ec0f5f531351')
sha256sums_aarch64=('f290bde05a324418e46e91439232a1ebf59e4d3a28168c7ead5e8985731a150d')

# Upstream ships a static-pie (musl) single binary, so there are no runtime
# shared-library dependencies and no build step. The release tarball contains
# one file (llm); the LICENSE is fetched separately from the repo.

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
