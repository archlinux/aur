# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=antares-sql-bin
pkgver=0.7.12
pkgrel=2
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX."
arch=("aarch64" "armv7h" "x86_64")
url="https://antares-sql.app/"
_githuburl="https://github.com/antares-sql/antares"
license=("MIT")
depends=('hicolor-icon-theme' 'electron' 'gcc-libs' 'glibc')
conflit=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/Antares-${pkgver}-linux_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/antares-sql/antares/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('99b00c37ea6d7b39d445097d8024f9156f9c3cf82e86f44db745a3b2cf5114b6'
            '3fc8cce758f6dc337a6392b9252144ba88a31d726634489352ec1aae7bb8945b')
sha256sums_aarch64=('42b4b31a5d601f5b16fb8bb4dd498d517b0261405a855908123294ab909b7f97')
sha256sums_armv7h=('041ed31374bd32905e13f967810e89c785de941455b6308dbf811bba81b33827')
sha256sums_x86_64=('10c18d925fd03f1033ebf76561b00e08afe78ee806625883b4f97a77252f50bb')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Antares/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/Antares/${pkgname%-sql-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${pkgname%-sql-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-sql-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-sql-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-sql-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}