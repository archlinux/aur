# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Kevin Maris <aur@kmaris.net>
pkgname=devbox-bin
pkgver=0.14.2
pkgrel=1
pkgdesc="A command-line tool that lets you easily create isolated shells for development.(Written in Go.Prebuilt version)"
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
depends=(
    'docker'
    'nix'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('a39c78d707cd1520417e6d0f0eec49d13845b363dee6945b65ce5a0045aed444')
sha256sums_armv7h=('a39c78d707cd1520417e6d0f0eec49d13845b363dee6945b65ce5a0045aed444')
sha256sums_i686=('9821d6165d595f5f86bf63f3c39b9b813e9735813c759b970c624876f4a5d7ab')
sha256sums_x86_64=('1702a327dc27712f408b99c90df0414ddf15ec3f15472ec006e95947f2a5dde7')
prepare() {
    "${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
    if [ -x /usr/bin/fish ];then
        "${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
    fi
    if [ -x /usr/bin/zsh ];then
        "${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/${pkgname%-bin}.zsh"
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    if [ -f "${srcdir}/${pkgname%-bin}.fish" ];then
        install -Dm644 "${srcdir}/${pkgname%-bin}.fish" "${pkgdir}/usr/share/fish/vendor.completions.d/${pkgname%-bin}.fish"
    fi
    if [ -f "${srcdir}/${pkgname%-bin}.zsh" ];then
        install -Dm644 "${srcdir}/${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    fi
}