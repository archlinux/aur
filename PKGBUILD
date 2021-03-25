# Maintainer: taotieren <admin@taotieren.com>
_pkgname=SerialTool
pkgname=serialtool
pkgver=1.4.0alpha
pkgrel=7
pkgdesc="A practical Serial-Port/TCP/UDP debugging tool."
arch=('any')
url="https://github.com/Skiars/SerialTool"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname}  'serialtool-git')
#replaces=(${pkgname})
depends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'icoutils')
makedepends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}.zip::https://github.com/Skiars/${_pkgname}/archive/refs/tags/v${pkgver}.zip"
        "${pkgname}.desktop"
        "20-usb-serial.rules"
        "${pkgname}.install"
        "io.github.skiars.serialtool.metainfo.xml")
sha256sums=('95b8780eecc007fae461025d1c3db8b2158905e9379541632ab791c3c5e72455'
            'f646db8d3d577589da15a555653a91ae725be626c933e384ba07db8b9bdc30c8'
            'bd504256698f7e7b1a74fbc6490276f0c096c2e6b5e7199049766b7ba7c860a7'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4'
            '41a8f888c8bccdd06a808469a2d37183879b1244b822b397e14bf1b2a013bdc7')

build() {
    cp -r "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/resource/images/logo.ico" "${srcdir}/${_pkgname}-${pkgver}/${pkgname}.ico"
#icotool -x "${srcdir}/${_pkgname}-${pkgver}/${pkgname}.ico"
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    icotool -x "${pkgname}.ico"
    cd ${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/
    qmake 
    make
}

package() {
    install -dm755 "${pkgdir}/usr/bin/" \
                   "${pkgdir}/usr/share/${pkgname}/" \

    cd ${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/
    cp --preserve=mode -r ${_pkgname} language config themes slave  "${pkgdir}/usr/share/${pkgname}/"

    ln -sf  "/usr/share/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    #install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/resource/images/logo.ico" "${pkgdir}/usr/share/pixmaps/${pkgname}.ico"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
    install -Dm644 "${srcdir}/io.github.skiars.serialtool.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.skiars.serialtool.metainfo.xml"

    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}_7_16x16x32.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}_6_20x20x32.png" "${pkgdir}/usr/share/icons/hicolor/20x20/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}_5_24x24x32.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}_4_32x32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}_3_64x64x32.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}_2_128x128x32.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}_1_256x256x32.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
