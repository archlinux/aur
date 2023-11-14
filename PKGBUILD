# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Braeden Mollot <3mollot at gmail dot com>
pkgname=min-browser-bin
_pkgname=Min
pkgver=1.29.0
pkgrel=2
pkgdesc="A fast, minimal browser that protects your privacy"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://minbrowser.org/"
_githuburl="https://github.com/minbrowser/min"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('9672e5a80166f2b6005f8daf9295d910096e3aad359aaba2e2520f6b2a95101d')
sha256sums_aarch64=('614499546ad833c5eb84c394963374911806939d78188510b5b4f9994c3d07f4')
sha256sums_armv7h=('cefb1f470dfc459e29f1a14210f4c14438c25ed197e4b15781e6656b95c9cb8d')
sha256sums_x86_64=('6c61f2450b9aa8d4eec7567dfeb7bc1443db53a0b5b25a33e3f062498891d370')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/opt/${_pkgname}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|/opt/${_pkgname}/${pkgname%-browser-bin} %U|${pkgname%-bin}|g;s|Icon=${pkgname%-browser-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-browser-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-browser-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-browser-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}