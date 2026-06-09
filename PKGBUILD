# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krillinai-bin
_pkgname=KrillinAI
pkgver=2.0.3
pkgrel=1
pkgdesc="A video translation and dubbing tool powered by LLMs, offering professional-grade translations and one-click full-process deployment.It can generate content optimized for platforms like YouTube，TikTok, and Shorts.(Prebuilt version)"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://github.com/krillinai/KrillinAI"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
makedepends=('gendesk')
optdepends=('ollama: Use you local LLMs')
source=(
    "${pkgname%-bin}-${pkgver}.jpg::https://raw.githubusercontent.com/krillinai/KrillinAI/v${pkgver}/docs/images/logo.jpg"
    "${pkgname%-bin}-${pkgver}.toml::https://raw.githubusercontent.com/krillinai/KrillinAI/v${pkgver}/config/config-example.toml"
    "README-${pkgver}.md::https://raw.githubusercontent.com/krillinai/KrillinAI/v${pkgver}/README.md"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64")
sha256sums=('a009d0178d1fe67ff2c79a71076c21aff1c172bd3657e205d54bdb41f8ffdde1'
            '0c955a4ed93dcdeda32ea966ea4ac5bbcb05165cc16a142484008f3df539b93f'
            '9745b24ee9f2c96dfe586226ca1b7f10506032b866367748506b97342f5822e7')
sha256sums_aarch64=('a68ba32b6679bae5404770316bd9c123ac0b718965d0c15e9d4081c46f35dbad')
sha256sums_i686=('77a3d68340be07de1b13b745eb27c918005c969b509cd3b1d11b3497923aee3f')
sha256sums_x86_64=('369b894b635fcc6705c4aa1b6af2b21eede1e824b8ad6fbb9f3e551ee58155b8')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/lib/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.toml" "${pkgdir}/usr/lib/${pkgname%-bin}/config/config.toml"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.jpg" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.jpg"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
