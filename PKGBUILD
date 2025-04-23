# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
pkgname=tbls-bin
pkgver=1.85.1
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database.Written in Go.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/k1LoW/tbls"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/k1LoW/tbls/v${pkgver}/LICENSE"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.rpm")
sha256sums=('6eefa0bec6e7c3654bdc29cb8f8c4adbc1327d2e912b532aacc68f6e2fa9d63c')
sha256sums_aarch64=('bc9b5c497d4364f73e0cb94d435aa3a272e6dafe8e77f8718c40ea38d2187e96')
sha256sums_x86_64=('5b8fedffd23cb3452ae95600a579b067535a0366f9cba33b4fde995e3f659844')
prepare() {
    "${srcdir}/usr/bin/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
    if [ -x "/usr/bin/fish" ];then
        "${srcdir}/usr/bin/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
    fi
    if [ -x "/usr/bin/zsh" ];then
        "${srcdir}/usr/bin/${pkgname%-bin}" completion zsh  > "${srcdir}/${pkgname%-bin}.zsh"
    fi
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    if [ -f "${srcdir}/${pkgname%-bin}.fish" ];then
        install -Dm644 "${srcdir}/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    fi
    if [ -f "${srcdir}/${pkgname%-bin}.zsh" ];then
        install -Dm644 "${srcdir}/${pkgname%-bin}.zsh" -t "${pkgdir}/usr/share/zsh/site-functions"
    fi
}