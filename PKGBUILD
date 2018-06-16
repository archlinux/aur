# Maintainer: Paul Davis <paul@dangersalad.com>
pkgname=megamek
pkgver=0.43.11
_pkgver=-RC5
pkgrel=1
epoch=
pkgdesc="MegaMek is a networked Java clone of BattleTech, a turn-based sci-fi boardgame for 2+ players. Fight using giant robots, tanks, and/or infantry on a hex-based map."
arch=('x86_64')
url="https://github.com/MegaMek/megamek"
license=('GPL')
groups=()
depends=('jdk10-openjdk')

source=("https://github.com/MegaMek/megamek/releases/download/v${pkgver}/${pkgname}-${pkgver}${_pkgver}.tar.gz"
        "megamek.desktop"
        "startup.patch"
        "megamek.sh")

sha256sums=('23b071342fc1973600c77fe993e149517bdc2c4ea5584c5e8bfe60bca2cb2988'
            'caf5bf3e7294029c7b6dec974eed0253d6caf3804a6a9fcc953edc3c9be98b16'
            '1cf6d9253142d1392f613c8d288b5622247a9452fcd0b90c5230379c4bf8867c'
            'deb984a86a5de85e9e9eef8a2e702825c58842de5780f063e688ffd33b45a7ed')

package() {
    install -D "${pkgname}-${pkgver}${_pkgver}/MegaMek.jar" \
            "${pkgdir}/usr/lib/${pkgname}/MegaMek.jar"

    patch "${pkgname}-${pkgver}${_pkgver}/startup.sh" startup.patch
    
    install -Dm755 "${pkgname}-${pkgver}${_pkgver}/startup.sh" \
            "${pkgdir}/usr/lib/${pkgname}/startup.sh"

    cp -r "${pkgname}-${pkgver}${_pkgver}/data" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/docs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/lib" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/logs" "${pkgdir}/usr/lib/${pkgname}"

    cp -r "${pkgname}-${pkgver}${_pkgver}/mmconf" "${pkgdir}/usr/lib/${pkgname}"
    
    install -D megamek.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 megamek.sh "${pkgdir}/usr/bin/${pkgname}"

}
