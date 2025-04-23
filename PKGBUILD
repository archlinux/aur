# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krillinai-bin
_pkgname=KrillinAI
pkgver=1.1.4
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
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/krillinai/KrillinAI/v${pkgver}/docs/images/logo.png"
    "${pkgname%-bin}-${pkgver}.toml::https://raw.githubusercontent.com/krillinai/KrillinAI/v${pkgver}/config/config-example.toml"
    "README-${pkgver}.md::https://raw.githubusercontent.com/krillinai/KrillinAI/v${pkgver}/README.md"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64")
source_i686=("${pkgname%-bin}-${pkgver}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64")
sha256sums=('c2f175b895e0fcb0eb74f992ad29a5f91cc99fb4b677dbbbec3b71473b15a68d'
            'f359c7dac24eda3abadb0998af3b3bbf5223b8b43f6b0d9c3b0411ca9fd8d2db'
            '9367ff942145096931dfe9de61813bd16530bbf87037f18e2701adb212248086')
sha256sums_aarch64=('ec3e361c78552a3479cc638338741c5bf269d1e5da5564a84694ec5066b37aa0')
sha256sums_i686=('1b2d41c96c5c8584f7640dddff05cd477d458bec11ea3da737b114469271b069')
sha256sums_x86_64=('526352074ea7de8adbf73c12e265268ecd8916bab94fe0ae46e661de978fe62b')
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
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md"
}
