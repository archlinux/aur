# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=rust-llm-bin
_pkgname=llm
pkgver=0.1.9
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
sha256sums_x86_64=('29c1306a4785a31027e9652078acef8366c9b46911d3686c68e4959923d338f1')
sha256sums_aarch64=('c442822f068cd8ae82f0d420f8e0d40b058edf4515ad513f2c93a0ea7120c817')

# Upstream ships a static-pie (musl) single binary, so there are no runtime
# shared-library dependencies and no build step. The release tarball contains
# one file (llm); the LICENSE is fetched separately from the repo.

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
