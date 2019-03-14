# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=tumic0
_pkgname=QtPBFImagePlugin
pkgname=qt5-pbfimageplugin
pkgver=1.3
pkgrel=1
pkgdesc='Qt image plugin for displaying Mapbox vector tiles'
arch=('i686' 'x86_64')
url='https://github.com/tumic0/QtPBFImagePlugin'
license=('LGPL3')
depends=('qt5-base' 'protobuf')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("https://github.com/${_orgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        'Qt5Gui_QPbfPlugin.cmake')
sha256sums=('cae26f9fde6dd72ccf255ae96c879610ca61f27d3475afbb2745e91679072b49'
            'c927c3832fe39d674c6225ad9070d3c667f1ff9d37d398669a969cdfcee1e984')

build() {
    cd ${_pkgname}-${pkgver}

    qmake pbfplugin.pro
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    install -Dm755 libpbf.so ${pkgdir}/usr/lib/qt/plugins/imageformats/libpbf.so
    install -Dm644 ../Qt5Gui_QPbfPlugin.cmake ${pkgdir}/usr/lib/cmake/Qt5Gui/Qt5Gui_QPbfPlugin.cmake
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
