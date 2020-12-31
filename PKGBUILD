# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=tumic0
_pkgname=QtPBFImagePlugin
pkgname=qt5-pbfimageplugin
pkgver=2.3
pkgrel=1
pkgdesc='Qt image plugin for displaying Mapbox vector tiles'
arch=(x86_64)
url='https://github.com/tumic0/QtPBFImagePlugin'
license=('LGPL3')
depends=('qt5-base' 'protobuf')
makedepends=('qt5-tools')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")
source=("https://github.com/${_orgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        'Qt5Gui_QPbfPlugin.cmake')
sha256sums=('d1b4d0e8d79e3c17aad3bfe0c349002cb30c31cb1be5535aec44c71ee4f0891a'
            'c927c3832fe39d674c6225ad9070d3c667f1ff9d37d398669a969cdfcee1e984')

build() {
    cd ${_pkgname}-${pkgver}

    qmake pbfplugin.pro
    make
}

package() {
    cd ${_pkgname}-${pkgver}

    make INSTALL_ROOT="${pkgdir}" install

    install -Dm644 ../Qt5Gui_QPbfPlugin.cmake ${pkgdir}/usr/lib/cmake/Qt5Gui/Qt5Gui_QPbfPlugin.cmake
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
