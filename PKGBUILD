# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A cli tool to easily create isolated shells and containers with nix."
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'x86_64'
)
url="https://www.jetpack.io/devbox/"
_ghurl="https://github.com/jetpack-io/devbox"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
optdepends=(
    'docker'
    'nix'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('9a0cd696c108b7d81310683631eff7cdc9e96cd4b227bd6c408d77dc96719b99')
sha256sums_armv7h=('9a0cd696c108b7d81310683631eff7cdc9e96cd4b227bd6c408d77dc96719b99')
sha256sums_i686=('5688ad5bce28871c518e42b7d49f096970a166732ab15f7cc00b43f02bb7e255')
sha256sums_x86_64=('44b8ebc6727257a1ea8f16f53f0a223f0e05b7ffe82283d93c03cc4593481df0')
build() {
    "${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/bash.completion"
    "${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/fish.completion"
    "${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/zsh.completion"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/bash.completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/fish.completion" "${pkgdir}/usr/share/fish/vendor.completions.d/${pkgname%-bin}.fish"
    install -Dm644 "${srcdir}/zsh.completion" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
}