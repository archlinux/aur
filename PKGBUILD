# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
pkgname=tbls-bin
pkgver=1.74.0
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database"
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb")
sha256sums=('6eefa0bec6e7c3654bdc29cb8f8c4adbc1327d2e912b532aacc68f6e2fa9d63c')
sha256sums_aarch64=('c87371a3018dd97faa8f910b569e3dbb409e0c9f909368df1368db146ea96e7b')
sha256sums_x86_64=('67cfd9cf8ffb55b18610250689be5059ebf9e1489c4be1420d7fbe117a26dd3b')
build() {
    bsdtar -xf "${srcdir}/data."*
    "${srcdir}/usr/bin/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}"
    "${srcdir}/usr/bin/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
    "${srcdir}/usr/bin/${pkgname%-bin}" completion zsh > "${srcdir}/_${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 "${srcdir}/_${pkgname%-bin}" -t "$pkgdir/usr/share/zsh/site-functions"
}