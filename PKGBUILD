# Maintainer: Christoph Sterz <christoph.sterz@kdab.com>
pkgname=kddockwidgets-git
pkgver=r1090.899ca6a
pkgrel=1
arch=('x86_64')
pkgdesc="KDAB's Dock Widget Framework for Qt"
license=("GPL2" "custom:KDAB commercial license")
depends=('qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools')
url="https://www.kdab.com/kddockwidgets/"
source=("${pkgname}::git+https://github.com/KDAB/KDDockWidgets.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -G Ninja \
        "../${pkgname}"
    ninja
}

package() {
    cd build
    DESTDIR="${pkgdir}" ninja install
}
