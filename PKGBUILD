# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.9.1
pkgrel=2
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
sha256sums_aarch64=('75257969b07f1c02ab1ab8ee12c4be6b3643fc8090bdc8f82012ba1f05d32e07')
sha256sums_armv7h=('75257969b07f1c02ab1ab8ee12c4be6b3643fc8090bdc8f82012ba1f05d32e07')
sha256sums_i686=('369c469530e3b1defeeeb5d9868e2aed8c67cafdf48d1de50cda4a5147f3ba39')
sha256sums_x86_64=('05472c8e5052041f452f487ba1acbabb660fdbb67972f3f5b89ecaf7da8ceec3')
build() {
    exec "${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/bash.completion"
    exec "${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/fish.completion"
    exec "${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/zsh.completion"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/bash.completion" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/fish.completion" "${pkgdir}/usr/share/fish/vendor.completions.d/${pkgname%-bin}.fish"
    install -Dm644 "${srcdir}/zsh.completion" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
}