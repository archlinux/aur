# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer :  Biginoz 
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
pkgname=whalebird-bin
_pkgname=Whalebird
pkgver=5.1.1
pkgrel=2
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://whalebird.social/"
_ghurl="https://github.com/h3poteto/whalebird-desktop"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron22'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('556acfb66a0f37d7be1b838c37aa371228efd3655c6d212ac2ecd5749c9ec57a'
            '7923440bf061d75d34e967f7f5ac538c0686ab0c23b2f522c8c6276ec823b36b')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/build/icons/"*.* -t "${pkgdir}/usr/lib/${pkgname%-bin}/build/icons"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/build/sounds/"*.wav -t "${pkgdir}/usr/lib/${pkgname%-bin}/build/sounds"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t"${pkgdir}/usr/share/pixmaps"
}