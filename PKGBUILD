# Maintainer: Infernio <infernio at icloud dot com>
pkgname=air-for-steam-git
pkgver=2019_0917.r8.gc485ecc
pkgrel=1
pkgdesc="An elegant and customizable skin for Steam"
arch=('any')
url="https://github.com/leskal/Air-for-Steam"
license=('custom:cc-by-nc-4.0')
depends=('steam' 'sssm>=1.2.0')
makedepends=('git')
provides=('air-for-steam')
conflicts=('air-for-steam')
install=air-for-steam.install
source=('git+https://github.com/leskal/Air-for-Steam.git')
sha256sums=('SKIP')

pkgver() {
    git -C "Air-for-Steam" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/_/;s/-/./g;s/^v//'
}

package() {
    cd "${srcdir}"
    DESTDIR="${pkgdir}/usr/share/steam/skins/air-for-steam"
    LCNSDIR="${pkgdir}/usr/share/licenses/air-for-steam"
    FONTDIR="${pkgdir}/usr/share/fonts/air-for-steam"

    mkdir -p "${DESTDIR}"
    mkdir -p "${LCNSDIR}"
    mkdir -p "${FONTDIR}"
    cp -r "Air-for-Steam/." "${DESTDIR}"
    cp "${DESTDIR}/LICENSE.txt" "${LCNSDIR}"
    cp "${DESTDIR}/+Extras/Fonts"/* "${FONTDIR}"
}
