# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer :  Biginoz 
# Contributor :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)
# Contributor : Mélanie Chauvel (ariasuni) <perso@hack-libre.org>
pkgname=whalebird-bin
pkgver=5.0.7
pkgrel=2
pkgdesc="An Electron based Mastodon, Pleroma, and Misskey client"
arch=('x86_64')
url="https://whalebird.social/"
_githuburl="https://github.com/h3poteto/whalebird-desktop"
license=('GPL3')
depends=('bash' 'electron21' 'hicolor-icon-theme')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/Whalebird-${pkgver}-linux-amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('cd7969a3cc7866e71602a97653f8ff9c9546ca7819886f42f5be5b0501a718c4'
            '17568c4e29671159815f2fb3635ec6d1e43690fd171c2e2ffa3d2d0fe921c690')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Whalebird/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/Whalebird/whalebird %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 44x44 50x50 150x150 256x256 310x310;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}