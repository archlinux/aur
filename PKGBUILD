# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream was renamed from llm to yak in v0.3.7 (config migrates
# ~/.llm -> ~/.yak automatically on first run).

pkgname=rust-yak-bin
_pkgname=yak
pkgver=0.3.7
pkgrel=1
pkgdesc='Terminal-first AI coding agent in Rust'
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
sha256sums_x86_64=('0d30e4b54bdb09e8b26eca194f535e4757690ea9f88071ffae95336f22354e75')
sha256sums_aarch64=('6a805ef1d6e9a6391306833d0d1d84df6ba0c2939776931f21420d30139fdeb0')

# Upstream ships a static-pie (musl) single binary, so there are no runtime
# shared-library dependencies and no build step. The release tarball contains
# one file (yak); the LICENSE is fetched separately from the repo.

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
