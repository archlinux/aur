# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krillinai-bin
_pkgname=KrillinAI
pkgver=2.0.2
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
            'c27209d46d1b9efbedb2b7af0a5d4ec7ad9c800159b371252f07282b0ed9bdf8'
            '9745b24ee9f2c96dfe586226ca1b7f10506032b866367748506b97342f5822e7')
sha256sums_aarch64=('114cc4d2a90c4c782eb10e4d21daa4b9b341d61072461968722e726e9cc3fa81')
sha256sums_i686=('8855ac47bf0cc21ff3d547d03de40d0a678cc754204c5e242e562909e6c03f6d')
sha256sums_x86_64=('29761c7984855d023eae73cbc5bf46311440a1d2ede4395db61329bd446d361f')
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
