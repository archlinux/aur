# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="mate-window-applets"
pkgname="mate-window-buttons-applet"
pkgver=19.10.2
pkgrel=1
pkgdesc="Modern free desktop icon theme whose design is based around the\
 use of bold colours and simple geometric shapes to compose icons with\
 pixel perfect rendering."
url="https://github.com/ubuntu-mate/mate-window-applets"
arch=('any')
license=('GPL3')
depends=('mate-panel')
makedepends=('meson' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=("mate-window-applets-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b537273f9b68427555d148a32b7fb87bf5a148ea697c5717a297f1c462a31b2d')

build() {
    cd "${_pkgname}-${pkgver}"
    meson --prefix=/usr build
    cd build
    ninja
}

package() {
    cd "${_pkgname}-${pkgver}/build"
    export DESTDIR="${pkgdir}"
    ninja install
    cp -a ../data/pixmaps/* "${pkgdir}/usr/share/icons/"
    install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
