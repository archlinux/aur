# Maintainer: taotieren <admin@taotieren.com>

pkgname=nrf-command-line-tools-bin
_pkgname=${pkgname%-bin}
pkgver=10.16.0
pkgrel=0
arch=('x86_64')
options=(!strip)
conflicts=()
replaces=()
pkgdesc="The nRF Command Line Tools is used for development, programming and debugging of Nordic Semiconductor's nRF51, nRF52, nRF53 and nRF91 Series devices."
license=('Commercial')
url="https://www.nordicsemi.com/Products/Development-tools/nrf-command-line-tools/download"
source_x86_64=("https://nsscprodmedia.blob.core.windows.net/prod/software-and-other-downloads/desktop-software/${_pkgname}/sw/versions-10-x-x/${pkgver//./-}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_x86_64=('bfe72b5e5804103d8e66295f093848f30cac3d04124dfe17e793bdcccd206f95')
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

    ln -sf /opt/nrf-command-line-tools/bin/nrfjprog ${pkgdir}/usr/bin/nrfjprog
    ln -sf /opt/nrf-command-line-tools/bin/mergehex ${pkgdir}/usr/bin/mergehex

}


