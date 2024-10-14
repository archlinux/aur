# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mockery-bin
pkgver=2.46.3
pkgrel=1
pkgdesc='A mock code autogenerator for golang.Prebuilt version.'
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
sha256sums_aarch64=('030f08380963ec3520adb1f11d7c811a583c498ea933e76d1c189eb8e7caa53a')
sha256sums_x86_64=('af9bd810fd0ac4d12fe362d2606f7d38afa74ea782867408243b01d09858cb10')
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