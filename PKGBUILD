# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: ValHue <vhuelamo at gmail dot com>

_pkgname="mate-window-applets"
pkgname="mate-window-buttons-applet"
pkgver=20.04.0
pkgrel=1
pkgdesc="An applet for mate-panel to shows the close,minimize,actions in a panel."
url="https://github.com/ubuntu-mate/mate-window-applets"
arch=('any')
license=('GPL3')
depends=('mate-panel')
makedepends=('meson' 'vala')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
options=('!strip')
source=("mate-window-applets-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('788dd84b1c8b8d9fe38453612f9058485d87e9f152ff7ea9e1681f005a360a48')

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
