# Maintainer: taotieren <admin@taotieren.com>
_pkgname=QSerial
pkgname=qserial
pkgver=1.2
pkgrel=2
pkgdesc="An advanced cross-platform serial port utility"
arch=('aarch64'
    'riscv64'
    'x86_64')
url="https://github.com/tuna/QSerial"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
_qt=qt6
depends=(
    glibc
    gcc-libs
    libusb
    $_qt-base
    $_qt-webchannel
    $_qt-webengine
    $_qt-5compat
    $_qt-serialport)
makedepends=($_qt-tools)
backup=()
options=()
source=("${_pkgname}-${pkgver}.zip::${url}/archive/v${pkgver}.zip"
    "${pkgname}.desktop")
sha256sums=('a4566828c319a909852b2de8ec17be25092e26d511426e8ded90745a7f095030'
            '26d2b87276ab02ba15cc5d947721bde4fab7378d139ecb308ae70a0652ed394c')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    qmake6 ${pkgname}.pro
    make
}

package() {
    install -Dm755 ${srcdir}/${_pkgname}-${pkgver}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
