# Maintainer: taotieren <admin@taotieren.com>

pkgname=tms-controller
pkgver=1.4.0
pkgrel=1
pkgdesc="TMS Controller is a professional liquid cooling unit communication control software that supports serial port communication with various liquid cooling devices."
arch=($CARCH)
url="https://gitee.com/zynwh/tms-controller"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    hicolor-icon-theme
)
makedepends=(
    git
    python-pyserial
    nuitka
    tk
    tcl
)
optdepends=(
)
backup=()
options=('!strip' '!debug' '!lto')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('cf72a6ac1171a57ad556b83ce3f0c028c380c33e66e8e4858977734294817385')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    python build_nuitka.py
}

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm755 "dist/TMS-Controller_v${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
    install -vDm644 "dist/tms-controller.desktop" -t "${pkgdir}/usr/share/applications/"
    install -vDm644 "dist/${pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
}
