# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer :  Biginoz 
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
pkgname=whalebird-bin
_pkgname=Whalebird
pkgver=5.1.0
pkgrel=1
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://whalebird.social/"
_githuburl="https://github.com/h3poteto/whalebird-desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron22')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('d24dfe49e3dca978fceb6db32f2ab51ca11fbc582ac63734e4cf1cb1b5b58f6d'
            'd7992b859b00b218f3102b56cd1f038b89ef33a6fd3ac9b409e491c4c442ec06')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${_pkgname}/resources/build" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t"${pkgdir}/usr/share/pixmaps"
}