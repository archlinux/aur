# Maintainer: notscripter <grx8x0mfy@mozmail.com>
pkgname=tauno-serial-plotter-bin
_pkgname=tauno-serial-plotter
pkgver=1.19.4
pkgrel=17
epoch=
pkgdesc="Serial Plotter for Arduino and other embedded devices."
arch=(i686 x86_64)
url="https://github.com/taunoe/tauno-serial-plotter"
license=('GPL-3.0')
groups=()
depends=(python-pyqt5 python-pyqtgraph)
makedepends=()
checkdepends=()
optdepends=()
provides=(tauno-serial-plotter)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/taunoe/tauno-serial-plotter/archive/refs/tags/v${pkgver}.tar.gz)
noextract=()
sha256sums=(4ab6d3bcdbb7c84667409f304cfc9f6e0d5ef77b10b7bd78fce8fae07d459363)
validpgpkeys=()

prepare() {
    cd "$_pkgname-$pkgver"

    sed -i \
        -e "s/^Version=.*/Version=${pkgver}/" \
        -e "s|^Icon=.*|Icon=/usr/share/icons/hicolor/scalable/apps/tauno-plotter.svg|" \
        snap/gui/Tauno-Serial-Plotter.desktop

    sed -i '
    s|icon_logo = os.path.join(os.path.dirname(__file__), .icons/tauno-plotter.svg.)|icon_logo = '\''/usr/share/icons/hicolor/scalable/apps/tauno-plotter.svg'\''|;
    s|icon_minus = os.path.join(os.path.dirname(__file__), .icons/minus.svg.)|icon_minus = '\''/usr/share/icons/hicolor/scalable/apps/tauno-plotter-minus.svg'\''|;
    s|icon_plus = os.path.join(os.path.dirname(__file__), .icons/plus.svg.)|icon_plus = '\''/usr/share/icons/hicolor/scalable/apps/tauno-plotter-plus.svg'\''|;
    s|icon_arrow_down = os.path.join(os.path.dirname(__file__), .icons/arrow_down.svg.)|icon_arrow_down = '\''/usr/share/icons/hicolor/scalable/apps/tauno-plotter-arrow-down.svg'\''|;
    ' src/tauno-serial-plotter.py

}

package() {
    cd "$_pkgname-$pkgver"

    install -Dm644 snap/gui/Tauno-Serial-Plotter.desktop "${pkgdir}/usr/share/applications/tauno_serial_plotter.desktop"
    install -Dm644 src/icons/tauno-plotter.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tauno-plotter.svg"
    install -Dm644 src/icons/plus.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tauno-plotter-plus.svg"
    install -Dm644 src/icons/minus.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tauno-plotter-minus.svg"
    install -Dm644 src/icons/arrow_down.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/tauno-plotter-arrow-down.svg"

    install -Dm755 src/tauno-serial-plotter.py "${pkgdir}/usr/bin/tauno-serial-plotter"
}

