# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=antares-sql-bin
pkgver=0.7.13
pkgrel=1
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
sha256sums_aarch64=('5116e7f022f37eee15536e145687d105998824abfc3ee2fd081cac4451cbb8d0')
sha256sums_armv7h=('6245415d5cf0a78bd077a23ab20d6785a66f133907b3ca5da07c0ca26e2cbf19')
sha256sums_x86_64=('df6f1320a39717bd18e9663cb038d62dd6ec5f8e9694d83b5bf3334fe4191ec3')

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