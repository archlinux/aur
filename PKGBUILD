# Maintainer: taotieren <admin@taotieren.com>

pkgname=nrf-command-line-tools-bin
_pkgname=${pkgname%-bin}
pkgver=10.15.3
pkgrel=1
arch=('x86_64')
options=(!strip)
conflicts=()
replaces=()
pkgdesc="The nRF Command Line Tools is used for development, programming and debugging of Nordic Semiconductor's nRF51, nRF52, nRF53 and nRF91 Series devices."
license=('Commercial')
url="https://www.nordicsemi.com/Products/Development-tools/nrf-command-line-tools/download"
source_x86_64=("https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/${_pkgname}/sw/versions-10-x-x/${pkgver//./-}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('c03ac0d6cbbde5bf7fc8ceec3cd9c96af83248eb9b98d54551da5a616376c768')
optdepends=("nrf-udev: udev rules for nRF (Nordic Semiconductor) development kits"
            "jlink-software-and-documentation: Segger JLink software & documentation pack for Linux"
            "pc-nrfconnect-programmer: Programmer app for nRF Connect for Desktop")
# noextract=("${_pkgname}_${pkgver}_amd64.deb")

prepare() {
#    ar -x *.rpm
	mkdir -p ${pkgname}
    bsdtar -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb" --numeric-owner -C "${srcdir}/${pkgname}"
}

package() {
    export LC_CTYPE="zh_CN.UTF-8"
    bsdtar -xf "${srcdir}/${pkgname}/data.tar.gz" --numeric-owner -C "${pkgdir}"

    install -dm0755  "${pkgdir}/usr/bin/"
#                     "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/" \
#                     "${pkgdir}/usr/share/mime/packages/" \
#                     "${pkgdir}/usr/share/applications/"
#
    ln -sf /opt/nrf-command-line-tools/bin/nrfjprog ${pkgdir}/usr/bin/nrfjprog
    ln -sf /opt/nrf-command-line-tools/bin/mergehex ${pkgdir}/usr/bin/mergehex

#     ln -sf "/opt/${_pkgname}/${_softname}.desktop" "${pkgdir}/usr/share/applications/${_softname}.desktop"
#     ln -sf "/opt/${_pkgname}/${_softname}.png" "${pkgdir}/usr/share/pixmaps/${_softname}.png"
#     ln -sf "/opt/${_pkgname}/emmx.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/emmx.svg"
#     ln -sf "/opt/${_pkgname}/${_softname}.xml" "${pkgdir}/usr/share/mime/packages/${_softname}.xml"
}


