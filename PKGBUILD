# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=glyphr-studio-desktop-bin
_appname="Glyphr Studio"
pkgver=0.5.6
pkgrel=2
pkgdesc="A desktop client for Glyphr Studio built in electron.Glyphr Studio is a free, web based font designer."
arch=("x86_64")
url="https://www.glyphrstudio.com/"
_githuburl="https://github.com/glyphr-studio/Glyphr-Studio-Desktop"
license=('GPL3')
depends=('bash' 'electron9')
provides=("${pkgname%-desktop-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-desktop-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('ebdd7da4928699cf083c88417b5f105932cdf382f52f12205749a10f9d744097'
            '9ae082066ba60c5aa2c7ebae1830216394e26c7d879e0c6b22d06fe45395d19e')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}