# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="ficus"
pkgname="${_pkgname}-electron-bin"
pkgver=0.2.1
pkgrel=1
pkgdesc="A software for editing and managing markdown documents, developed by the gg=G team."
arch=('x86_64')
url="https://ficus.world/"
_githuburl="https://github.com/Thysrael/Ficus"
license=('MIT')
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-appimage")
depends=('electron')
makedepends=('gendesk')
source=("${_pkgname}-${pkgver}.asar::${_githuburl}/releases/download/v${pkgver}/app.asar"
    "https://raw.githubusercontent.com/Thysrael/Ficus/main/LICENSE"
    "${_pkgname}.png::https://raw.githubusercontent.com/Thysrael/Ficus/main/build/icon.png"
    "${_pkgname}.sh")
sha256sums=('fb3a407722baa7b48b81db2753ae12f47799a3a434122d47db8b320c6c4ba993'
            '062dfd6ae4c19f555ebbdba752598c98510837687393a38a3602b711890430d7'
            '3c8344b3daac5c775a3bf38518e5eee024566d7ea0a3f72c543a7c7ae13f72ef'
            'b65134bc080370f215c0626d8c5054e4a7028df69c77d2073a8fb2334f0517c3')
      
package() {
    install -Dm755 "${srcdir}/${_pkgname}.sh" -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}.asar" "${pkgdir}/opt/${_pkgname}/${_pkgname}.asar"
    install -Dm644 "${srcdir}/${_pkgname}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --pkgname "${_pkgname}" --icon "${_pkgname}" --categories "Utility" --name "Ficus" --exec "/usr//bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}