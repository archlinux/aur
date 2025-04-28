# Maintainer: Raffaele Mancuso <raffaelemancuso532 at gmail dot com>
pkgname=pdf4qt-bin
_pkgname=PDF4QT
_appname=Pdf4qt
_runname=Pdf4Qt
pkgver=1.5.1.0
pkgrel=1
pkgdesc="Open source PDF editor(Prebuilt version)"
arch=('x86_64')
url="https://jakubmelka.github.io/"
_ghurl="https://github.com/JakubMelka/PDF4QT"
license=('LGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}=${pkgver}")
depends=(
    'openssl'
    'libjpeg-turbo'
    'qt6-speech'
    'qt6-svg'
    'qt6-base'
    'openjpeg2'
    'onetbb'
    'lcms2'
    'blend2d'
)
makedepends=(
    'fuse'
)
optdepends=(
	'flite: Text-To-Speech using flite synthesizer',
	'libspeechd: Text-To-Speech using speechd synthesizer'
)
source=(
	"${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}.AppImage"
)
sha256sums=('74fb5be1e17555e3a5f5c4584c95273a737dc104bd227cd18a7d4fde624e36f1')
prepare() {
	if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/"{bin,lib,plugins,translations} "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -Pr --no-preserve=ownership "${srcdir}/squashfs-root/usr/share" "${pkgdir}/usr"
	install -Dm755 -d "${pkgdir}/usr/bin"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}LaunchPad" "${pkgdir}/usr/bin/${_runname}LaunchPad"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}Diff" "${pkgdir}/usr/bin/${_runname}Diff"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}Editor" "${pkgdir}/usr/bin/${_runname}Editor"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}PageMaster" "${pkgdir}/usr/bin/${_runname}PageMaster"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_runname}Viewer" "${pkgdir}/usr/bin/${_runname}Viewer"
}