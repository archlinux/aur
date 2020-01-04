# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.6.1
pkgrel=2
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'cmake' 'ninja' 'gettext')
source=("${url}/archive/${pkgver}.tar.gz" 'qt-5.14.patch')
sha256sums=('bd498eaa7f9cb4f05d2e19272fc09e5906a4af0a86853ee67c241adf6d70cc55'
            '8d4985dc11168944937db09e93cf20c36c1dcbae467ee4d836c05dab2d58d5f1')

prepare() {
    mkdir -p build
    cd "${_reponame}-${pkgver}"
    patch -Np1 -i ../qt-5.14.patch
}

build() {
    cd build
    cmake "../${_reponame}-${pkgver}" \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    ninja
}

package() {
    cd build
    DESTDIR="$pkgdir" ninja install
}
