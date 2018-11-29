# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="mate-window-applets"
pkgname="mate-window-buttons-applet"
pkgver=1.5.1
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
sha256sums=('916d208c70102d8a2330de50ed51b85f63575b464cf0f302a7de533aad1a28a4')

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
    cp -a ../data/icons/* "${pkgdir}/usr/share/icons/"
    install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 ft=sh et syn=sh ft=sh:
