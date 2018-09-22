# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.5.4
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'cmake' 'ninja' 'gettext')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a971fc83f059bd690269dbf8b6c0e9946b6f0a2a9c984f4b65bbb7363e5f3b07')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_reponame}-${pkgver} \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    ninja
}

package() {
    cd build
    DESTDIR="$pkgdir" ninja install
}
