# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.10.4
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
sha256sums_aarch64=('21e46f1ec86d61f11a39532dc022c12143a7aaa5fd08a1af8e9393ac1eb94a46')
sha256sums_armv7h=('21e46f1ec86d61f11a39532dc022c12143a7aaa5fd08a1af8e9393ac1eb94a46')
sha256sums_i686=('408f84b05d4fe3015d98c6998b43e9bcc2fe6dc7bcbdeccf083b2d9006d4895d')
sha256sums_x86_64=('503d6da8678fb64243f1f9ec70d2ce31a250f33b96849db10b9fc9e85f1654e0')
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