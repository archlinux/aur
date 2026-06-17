# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krillinai-bin
_pkgname=KrillinAI
pkgver=2.1.0
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
sha256sums_aarch64=('6be879562ce47f68dd98705859b2fd9c2fe2ccb7ab7611b2622ba8b8edc9de25')
sha256sums_i686=('f4f6a28b3fc1b7f5bc15513c7856c3d2fcdf5a7a2fd58c60533b8cda0cca81ac')
sha256sums_x86_64=('a289d48833870fac6fceec9c2fcf193b2e5370b483e00257b6b4acfdda5c1369')
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
