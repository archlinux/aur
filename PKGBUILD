# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: ValHue <vhuelamo at gmail dot com>

_pkgname="mate-window-applets"
pkgname="mate-window-buttons-applet"
pkgver=21.04.0
pkgrel=1
pkgdesc="An applet for mate-panel to shows the close,minimize,actions in a panel."
url="https://github.com/ubuntu-mate/mate-window-applets"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL3')
depends=('mate-panel')
makedepends=('meson' 'vala')
source=("mate-window-applets-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('721c1a65fb47f0d80a12798897c65e9c48ef6cc78d1132e2018681e22f00a89d')

build() {
    cd "${_pkgname}-${pkgver}"
    meson --prefix=/usr build
    cd build
    ninja
}

package() {
    cd "${_pkgname}-${pkgver}/build"
    DESTDIR="${pkgdir}" ninja install
    cp -a ../data/pixmaps/* "${pkgdir}/usr/share/icons/"
}
