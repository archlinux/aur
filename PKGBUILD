# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.10.3
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
sha256sums_aarch64=('527ce8cae7eeb4698e04ea86a18b7af00908dc3667f94199eae9d0a0ba14ec2c')
sha256sums_armv7h=('527ce8cae7eeb4698e04ea86a18b7af00908dc3667f94199eae9d0a0ba14ec2c')
sha256sums_i686=('c158ef48dd7120be195f6e4ef39e06a9a41ba51e766bad15cb6a2ecf0204a64a')
sha256sums_x86_64=('3c210f40a1aa9c0734eaf92fb9853575213d1c91772c19a857e706eee30deddd')
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