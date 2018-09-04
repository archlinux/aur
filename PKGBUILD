# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.5.3
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'cmake' 'ninja' 'gettext')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('91afed260ae6c41d93fea1dfaf4b000e8f2e9836fd0258d952e4ac7e00a2f365')

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
