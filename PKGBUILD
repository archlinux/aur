# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt5-color-widgets
pkgver=2021.01.01
pkgrel=1
pkgdesc='A user-friendly color dialog and several color-related widgets for Qt'
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('LGPL3')
depends=('qt5-base')
optdepends=('qt5-tools: for QtDesigner integration'
            'qtcreator: for QtCreator integration')
makedepends=('git' 'cmake')
provides=('qt-color-widgets-common')
conflicts=('qt-color-widgets-common')
replaces=('qt5-color-picker')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('1b6d34bede07885ea068ef9041d2158930b64c15f6d52af42aa0165182fe509c')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir build
    cd build
    cmake ..
    make QtColorWidgetsPlugin
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -d "${pkgdir}/usr/include/${pkgname}"
    mkdir -p "$pkgdir/usr/lib/qt/plugins/designer"
    install -Dvm644 "build/color_widgets_designer_plugin/libQtColorWidgetsPlugin-Qt52.so" "${pkgdir}/usr/lib/qt/plugins/designer/"
    find 'src' -type f -iname '*.hpp' -exec install -Dvm644 {} "${pkgdir}/usr/include/${pkgname}/" \;
    find 'include' -maxdepth 1 -type f -exec install -Dvm644 {} "${pkgdir}/usr/include/${pkgname}/" \;
}
