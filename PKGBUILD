# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.48.0
pkgrel=1
pkgdesc='A mock code autogenerator for golang.Prebuilt version.(Prebuilt version)'
arch=(
    'aarch64'
    'x86_64'
)
url='https://github.com/vektra/mockery'
license=("BSD-3-Clause")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "golang-${pkgname%-bin}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('389b911b1916dc2c915f2c77aee77b104d24b42ef353ec75664cb6363f809e86')
sha256sums_x86_64=('b42362f0865b82563cb3439e6aa48bc00944cb2a22c8949f8fcca52c7c425f13')
build() {
    "${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
    "${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
    "${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/${pkgname%-bin}.zsh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.fish" "${pkgdir}/usr/share/fish/vendor.completions.d/${pkgname%-bin}.fish"
    install -Dm644 "${srcdir}/${pkgname%-bin}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
