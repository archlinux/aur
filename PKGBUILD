# Maintainer: witt <1989161762 at qq dot com>
pkgname=excalidraw-pake-bin
_appname=${pkgname%-pake*}
_pakever=3.1.1
pkgver=1.0.0
pkgrel=1
pkgdesc="Use Pake to package Excalidraw."
arch=("x86_64")
url="https://github.com/excalidraw/excalidraw"
license=('MIT')
depends=(
	'gtk3'
    'webkit2gtk-4.1'
)
source=(
	"${pkgname}-v${pkgver}.deb::https://github.com/tw93/Pake/releases/download/V${_pakever}/${_appname^}_${CARCH}.deb"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/tw93/Pake/V${pkgver}/LICENSE"
)
sha256sums=('6704067a233de1bc2f5ec642812f4ddec71eed54048585eb446524ae17e87ca5'
            'a8cfae3105018e6018e5a046977a9919c0e975d8d5eab79fd19339182211f058')
options=(!strip)

prepare() {
	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
	sed -i 's/com-pake-//g' "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop"
}

package() {
	install -Dm755 "${srcdir}/usr/bin/pake" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/usr/share/applications/com-pake-${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/pake.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
