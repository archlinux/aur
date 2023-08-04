# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gmail-desktop-bin
_appname="Gmail Desktop"
pkgver=3.0.0_alpha.37
pkgrel=3
pkgdesc="Nifty Gmail desktop app (unofficial)"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=('bash' 'electron23' 'hicolor-icon-theme')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-${pkgver//_/-}-linux.deb"
    "LICENSE::https://raw.githubusercontent.com/timche/gmail-desktop/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('aa125803e43bd295154e3d0fa9def4fe3a89d1f312b15e2989aa3a25b1a49861'
            '056c7c1e5bf66eba0167d966d192c743f6b66ed854011c9b6dac04f959f8f5b5'
            '492cbaf77a754639fcd6f2adffa2287b59f44bab5f76336cb3d1307e60ec6ba0')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}