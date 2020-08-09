# Maintainer: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Mattia Basaglia <mattia.basaglia@gmail.com>

pkgname=qt5-color-widgets
pkgver=2020.8.9
pkgrel=1
pkgdesc='A user-friendly color dialog and several color-related widgets for Qt'
arch=('i686' 'x86_64')
url='https://github.com/TheCynicalTeam/Qt-Color-Widgets'
license=('LGPL3')
depends=('qt5-base')
optdepends=('qt5-tools: for QtDesigner integration'
            'qtcreator: for QtCreator integration')
makedepends=('git' 'cmake')
provides=('qt-color-widgets-common')
conflicts=('qt-color-widgets-common')
replaces=('qt5-color-picker')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('5325e843189cace2c5fa5cde6e193841a54c625daf817ffec22fe5d8e7a1be06')


build() {
    cd "$srcdir/$pkgname-$pkgver-$pkgrel"
    mkdir build
    cd build
    cmake ..
    make QtColorWidgetsPlugin
}

package() {
    cd "$srcdir/$pkgname-$pkgver-$pkgrel"
    install -d "${pkgdir}/usr/include/${pkgname}"
    mkdir -p "$pkgdir/usr/lib/qt/plugins/designer"
    install -Dvm644 "build/color_widgets_designer_plugin/libQtColorWidgetsPlugin-Qt52.so" "${pkgdir}/usr/lib/qt/plugins/designer/"
    find 'src' -type f -iname '*.hpp' -exec install -Dvm644 {} "${pkgdir}/usr/include/${pkgname}/" \;
    find 'include' -maxdepth 1 -type f -exec install -Dvm644 {} "${pkgdir}/usr/include/${pkgname}/" \;
}
