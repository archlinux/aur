# Maintainer: Isabella Basso do Amaral <isabbasso at riseup dot net>

_pkgname=desktop-app
pkgname=leanote
pkgver=2.7.0
pkgrel=1
pkgdesc="Note-taking app"
arch=("i686" "x86_64")
url="https://leanote.com/"
license=("GPL3")
depends=("electron" "gconf")
provides=("${pkgname}")

source=("leanote.desktop"
	"leanote")

sha256sums=('8dab30fe0835432e44b5a3a1d46aebde8716a2a47ba4031cbe2a01560987aa83'
	    '57155a0e423bc98f0e83acb35f03ace06b3de54bdc64b2373128671c801727b1')

source_x86_64=("${pkgname}-${pkgver}.zip::https://github.com/leanote/desktop-app/releases/download/v${pkgver}/leanote-desktop-linux-x64-v${pkgver}.zip")
source_i686=("${pkgname}-${pkgver}.zip::https://github.com/leanote/desktop-app/releases/download/v${pkgver}/leanote-desktop-linux-ia32-v${pkgver}.zip")

sha256sums_x86_64=('fe9821230b07e0e826e06ccab389b45c440051fb7a50a6626dd5deead244d984')
sha256sums_i686=('236c7b16e7e8367cb8c956c0fd15f033873acc2e3e915611bb36902a4eb1740d')

extract=("${pkgname}-${pkgver}.zip")

prepare() {
    echo "cleaning up directory..."
    rm -rf '__MACOSX'
    rm -rf '.DS_Store'
}

package() {
    install -D -m655 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${srcdir}/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

    rm -f "${srcdir}/${pkgname}"
    rm -f "${srcdir}/${pkgname}.desktop"

    chmod -R 700 "${srcdir}/resources/app/public/tinymce/plugins/leaui_mindmap"
    install -d "${pkgdir}/opt"
    cp -r "${srcdir}" "${pkgdir}/opt/leanote"
}
