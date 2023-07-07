# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gmail-desktop-bin
_subver=alpha.37
pkgver="3.0.0${_subver}"
pkgrel=1
pkgdesc="Nifty Gmail desktop app (nnofficial)"
arch=('x86_64')
url="https://github.com/timche/gmail-desktop"
license=('MIT')
depends=('electron' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver%${_subver}}-${_subver}/${pkgname%-bin}-${pkgver%${_subver}}-${_subver}-linux.deb"
    "LICENSE::https://raw.githubusercontent.com/timche/gmail-desktop/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('aa125803e43bd295154e3d0fa9def4fe3a89d1f312b15e2989aa3a25b1a49861'
            'd79b508a38d7e570a3e76fe165d1c29b5a78c4b9060d6eed2c426b37313fa360'
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