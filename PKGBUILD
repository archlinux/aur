# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easy-player
_appname=music_player
pkgver=0.1.0
pkgrel=1
pkgdesc="简易的音乐播放器 - 附带歌词功能"
arch=('x86_64')
url="https://github.com/CmarThaa/music_player"
license=('custom')
conflicts=("${pkgname}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('037bdc35125ff6c6e43cd45a46b6ba1383dca26d21f367c0329cb71624cc0116'
            'f9cd5ee858718043ce06afc23860b21319c96c2154dbac49db4d2f4bc07612c7')
build() {
    cd "${srcdir}/${_appname}-${pkgver}"
    npm install
    npm run make
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${pkgname}-linux-x64/resources/app.asar" "${pkgdir}/opt/${pkgname}/${pkgname}.asar"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/src/assets/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    gendesk -f -n --icon "${pkgname}" --categories "AudioVideo" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_appname}-${pkgver}/out/${pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}