# Maintainer: taotieren <admin@taotieren.com>
_pkgname=SerialTool
pkgname=serialtool
pkgver=1.5.5
pkgrel=1
pkgdesc="A practical Serial-Port/TCP/UDP debugging tool."
arch=('any')
url="https://github.com/HoGC/SerialTool"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname}  'serialtool-git')
#replaces=(${pkgname})
depends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script')
makedepends=('qscintilla-qt5' 'qt5-serialport' 'qt5-charts' 'qt5-script' 'qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
        "${pkgname}")
sha256sums=('5ee4013f73321cd5443e842f82e96eb1ccac31527591977a2deda686bd87f47c'
            'b93065b98d21ce9054da53004edf703d7801fe7657583f4f594eb04f25df672c')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/
    qmake
    make
}

package() {
    install -dm755 "${pkgdir}/usr/bin/" \
                   "${pkgdir}/usr/share/${pkgname}/"

    cd ${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/
    cp --preserve=mode -r ${_pkgname} language config themes slave  "${pkgdir}/usr/share/${pkgname}/"

    cd pkg/
    cp --preserve=mode -r icons "${pkgdir}/usr/share/"

    #ln -sf  "/usr/share/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/io.github.skiars.${pkgname}.desktop" "${pkgdir}/usr/share/applications/io.github.skiars.${pkgname}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/io.github.skiars.${pkgname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.skiars.${pkgname}.metainfo.xml"
}
