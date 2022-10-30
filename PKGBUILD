# Maintainer: Shayne Hartford <shaybox@shaybox.com>

_pkgname=pine64_updater
_old_pkgname=pinecil-firmware-updater
pkgname="${_old_pkgname}-git"
pkgver=r21.1b111e0
pkgrel=1
pkgdesc="Application for updating Pinecil soldering iron"
url="https://github.com/pine64/${_pkgname}"
arch=("any")
license=("Apache")
provides=("${_pkgname}" "${_old_pkgname}")
conflicts=("${_pkgname}" "${_old_pkgname}")
source=("git+${url}.git#branch=old-pinecil-updater")
md5sums=("SKIP")
depends=("dfu-util" "qt5-base")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    qmake
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "pinecil_firmware_updater" "${pkgdir}/usr/bin/${_old_pkgname}"
}
