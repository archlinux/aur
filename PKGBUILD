# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=capacity-tester
_pkgname=CapacityTester
pkgver=0.2
pkgrel=1
pkgdesc="A simple tool that attempts to determine if a drive is a fake or not."
arch=("x86_64" "i686" "aarch64")
url="https://github.com/c0xc/CapacityTester"
license=("GPL3")
conflicts=("${pkgname}-git" "${pkgname}-bin")
depends=("hicolor-icon-theme" "qt5-base")
makedepends=("gcc" "make")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
    "${pkgname}.desktop"
)
sha512sums=(
    '43612aba62c46f80a90d5a5e5a0c1e76ae2d97cae39f56ee1d7fc1ad279adc369078e48248eb9b57e6d148a11e686b783af5cd59297cbe8c8d1cbe5f8d3a16e3'
    '8fff523534831fe7ee0cd963cd60547b21a1f770c824383d8c1aeb00bf87ebf6687dc2a4925900e5d649dd2002d8b4b7bae547f2b2014bac29f5f614c230994a'
)

build() {
    cd ${_pkgname}-${pkgver}

    qmake
    make
}

package() {
    cd ${_pkgname}-${pkgver}
    install -Dm 755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 "res/USB_flash_drive.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    cd ${srcdir}
    install -Dm 644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
}
