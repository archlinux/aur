# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
pkgname=tbls-bin
pkgver=1.91.2
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
sha256sums_aarch64=('d5928bbd1ebee3b860d85d2df1bc2e4487dd612eaa5e5480561ddf4c290eb9ee')
sha256sums_x86_64=('5e1a7add75f527ee38fce58e1cb385d4adfc4acf21886b0da65d78cc64a20510')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [ -f "/usr/bin/bash" ];then
        "${srcdir}/usr/bin/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
        install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    fi
    if [ -f "/usr/bin/fish" ];then
        "${srcdir}/usr/bin/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
        install -Dm644 "${srcdir}/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    fi
    if [ -f "/usr/bin/zsh" ];then
        "${srcdir}/usr/bin/${pkgname%-bin}" completion zsh  > "${srcdir}/${pkgname%-bin}.zsh"
        install -Dm644 "${srcdir}/${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    fi
}
