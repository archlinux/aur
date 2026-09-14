# Maintainer: taotieren <admin@taotieren.com>
_pkgname=QSerial
pkgname=qserial
pkgver=1.2
pkgrel=8
pkgdesc="An advanced cross-platform serial port utility"
arch=($CARCH)
url="https://github.com/tuna/QSerial"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
_qt=qt6
depends=(
    git
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
source=("${pkgname}::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.desktop")
sha256sums=('6a46ff0ac5a6b5489a59afbf3a60f48c43ef1b2ee1e167096feabde1cebe9e0d'
            '26d2b87276ab02ba15cc5d947721bde4fab7378d139ecb308ae70a0652ed394c')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd ${srcdir}/${pkgname}
    qmake6 ${pkgname}.pro
    make
}

package() {
    install -Dm755 ${srcdir}/${pkgname}/${_pkgname} ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
