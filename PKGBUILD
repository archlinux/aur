# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=capacity-tester
_pkgname=CapacityTester
pkgver=0.3
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
    'c9ec20709f0a4d635b954549065d7a9f8bbb76069b0aab684a8e8fc6e1218302dcc0c7513d8f1281c3daba7dd415679a269d1d7b668577648a816b16d1a60122'
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
