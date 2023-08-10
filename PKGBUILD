# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=antares-sql-bin
_appname=Antares
pkgver=0.7.15
pkgrel=2
pkgdesc="A modern, fast and productivity driven SQL client with a focus in UX."
arch=("aarch64" "armv7h" "x86_64")
url="https://antares-sql.app/"
_githuburl="https://github.com/antares-sql/antares"
license=("MIT")
depends=('bash' 'hicolor-icon-theme' 'electron22' 'gcc-libs' 'glibc')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-linux_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/antares-sql/antares/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('7b960bb0bed7d2228b6a8a879558c97906cc041ab14ab1d1089959902f386613'
            'd91cbdd0be18fd645e8e826b2b31b3a01911d76138241b1ac0a1051fb8209a6b')
sha256sums_aarch64=('b0a30fe77619643668778281cdf910684a6116a4b6a7e1eac086a939fb8a73b4')
sha256sums_armv7h=('22e442df4df9bc01a8b2c0fb4d2e97b74364e24b55e910d34fd1447d7e847933')
sha256sums_x86_64=('2d4a0e40b873ca3f906f40a4f520dd94bd0fcac9adee9c87f578c13e7ab76a39')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/${_appname}/${pkgname%-sql-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${pkgname%-sql-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-sql-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-sql-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-sql-bin}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}