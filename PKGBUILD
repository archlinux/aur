# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.5.5
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'cmake' 'ninja' 'gettext')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('81e8f06c9d70ab45aacfc5aa6fb3929547198c7478cbd0cc6e523b68f430aa77')

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
