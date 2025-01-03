# Maintainer: wh201906 <wh201906@yandex.com>
# Maintainer: taotieren <admin@taotieren.com>

_pkgname=SerialTest
pkgname=serialtest
pkgver=0.3.5
pkgrel=2
pkgdesc="A cross-platform test tool for serial port, Bluetooth, TCP and UDP."
arch=($CARCH)
url="https://github.com/wh201906/SerialTest"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=('qcustomplot' 'qt5-serialport' 'qt5-connectivity')
makedepends=('qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install

# source mirrors
# https://bbs.archlinux.org/viewtopic.php?id=224443
# _pkg_mirrors=("${url}/archive/refs/tags/V${pkgver}.tar.gz"
#     "https://ghproxy.com/${url}/archive/refs/tags/V${pkgver}.tar.gz")

# General function for scanning a list of mirrors
# Author: grufo <madmurphy333@gmail.com>
# _get_mirror() {
#     local -n url_list=$1
#     local url_item
#     for url_item in ${url_list[@]}; do
#         if curl --output /dev/null --silent --head --fail "${url_item}"; then
#             echo -n "${url_item}"
#             return 0
#         fi
#     done
#     return 1
# }
#
# source=("${_pkgname}-${pkgver}.tar.gz::$(_get_mirror _pkg_mirrors)"
# "${pkgname}.install")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/V${pkgver}.tar.gz"
    "${pkgname}.install")
sha256sums=('66a3d2abd21e45aed5898e732236031b3148fa082cb26585dbab8a23cc1daaab'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/src/"
    qmake
    make -j$(($(nproc) + 1))
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/src/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm0644 "$srcdir/${_pkgname}-${pkgver}/pack/aur/io.github.wh201906.serialtest.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.wh201906.serialtest.metainfo.xml"
    install -Dm0644 "$srcdir/${_pkgname}-${pkgver}/pack/aur/io.github.wh201906.serialtest.desktop" "${pkgdir}/usr/share/applications/io.github.wh201906.serialtest.desktop"
    install -Dm0644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 "$srcdir/${_pkgname}-${pkgver}/src/icon/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    #    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
