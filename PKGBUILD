# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=krillinai-bin
_pkgname=KrillinAI
pkgver=1.2.1
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
            '72bfc04a91e95648ff84333b038d71b9b2c27d6e45c3fa0d249b271b6b41f07a'
            'beb6cbf51c4438fde72e124a9a220c81f6f0208caf85767b9fb7886997c542f9')
sha256sums_aarch64=('e12f101851d26058a38f0723576d3fbd5c99ce0a9ddd75bc6b6cca725892e75e')
sha256sums_i686=('a649feb0f06fe4404b8e4e842c02abae823db1ee09e8cea1998f745af5d6f36c')
sha256sums_x86_64=('ee4bd5b6cc55b053c4e9add93fbd5dde93665c3bb2430b72d6f0dc1c583cc826')
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
