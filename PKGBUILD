# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="csbooks-bin"
pkgver=7.5.0
pkgrel=1
pkgdesc="A smart book management and reading software,also a PDF reader, EPUB reader, MOBI reader and DJVU file reader."
arch=('x86_64')
url="https://caesiumstudio.com/csbooks/"
_githuburl="https://github.com/caesiumstudio/csBooks-updates"
license=('custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('electron' 'hicolor-icon-theme')
source=("${pkgname}-${pkgver}.pacman::${_githuburl}/releases/download/latest/csBooks-${pkgver}.pacman"
    "${pkgname%-bin}.sh")
sha256sums=('b1dfc2d6b137580b7bba60da5d97886369170f6b38b3154ad919847b9eca7afc'
            'c280898ec6cb9239dc64a9e7b1fc2b2e8afc6b36078e5f4001bc4fc820e57a9e')
package() {
    install -Dm644 "${srcdir}/opt/csBooks/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s|Exec=/opt/csBooks/${pkgname%-bin} %U|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp -r "${srcdir}/usr" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/csBooks/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}