# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gmail-desktop-bin
_pkgver=3.0.0-alpha.37
pkgver="3.0.0.alpha.37"
pkgrel=2
pkgdesc="Nifty Gmail desktop app (nnofficial)"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=('electron' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${_pkgver}/${pkgname%-bin}-${_pkgver}-linux.deb"
    "LICENSE::https://raw.githubusercontent.com/timche/gmail-desktop/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('aa125803e43bd295154e3d0fa9def4fe3a89d1f312b15e2989aa3a25b1a49861'
            '056c7c1e5bf66eba0167d966d192c743f6b66ed854011c9b6dac04f959f8f5b5'
            '0999a84214ff0c173cfa623d73846c27e9600f70f907fb1b43c16bf1a903c57f')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Gmail Desktop/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/usr" "${pkgdir}"
    sed "s|\"/opt/Gmail Desktop/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}