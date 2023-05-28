# Maintainer: taotieren <admin@taotieren.com>
# Maintainer: wh201906 <wh201906@yandex.com>

_pkgname=SerialTest
pkgname=serialtest
pkgver=0.3.1
pkgrel=1
pkgdesc="A cross-platform test tool for serial port, Bluetooth, TCP and UDP."
arch=('any')
url="https://github.com/wh201906/SerialTest"
license=('GPL-3.0-only')
provides=(${_pkgname})
conflicts=(${pkgname}-git)
#replaces=(${pkgname})
depends=('qcustomplot' 'qt5-serialport' 'qt5-connectivity')
makedepends=('qt5-tools')
backup=()
options=('!strip')
install=${pkgname}.install
source=("${_pkgname}-${pkgver}.tar.gz::https://ghproxy.com/${url}/archive/refs/tags/V${pkgver}.tar.gz"
        "${pkgname}.install")
sha256sums=('d41bfb9f1a8d07a08e3657c32e87bb25487033d1060c8ff593887ca6c6787b31'
            '303f34246c0d341e1093d6e486e2cbfdbbb0d122d751de649f562ebac37777b4')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/src/"
    qmake
    make -j4
}

package() {
    install -Dm0755 "${srcdir}/${_pkgname}-${pkgver}/src/${_pkgname}"  "${pkgdir}/usr/bin/${pkgname}"

    install -Dm0644 "$srcdir/${_pkgname}-${pkgver}/pack/aur/io.github.wh201906.serialtest.metainfo.xml" "${pkgdir}/usr/share/metainfo/io.github.wh201906.serialtest.metainfo.xml"

    install -Dm0644 "$srcdir/${_pkgname}-${pkgver}/pack/aur/io.github.wh201906.serialtest.desktop" "${pkgdir}/usr/share/applications/io.github.wh201906.serialtest.desktop"

    install -Dm0644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 "$srcdir/${_pkgname}-${pkgver}/src/icon/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
#    install -Dm0644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/pkg/20-usb-serial.rules" "${pkgdir}/etc/udev/rules.d/20-usb-serial.rules"
}
