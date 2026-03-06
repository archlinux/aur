# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>
# Contributor: MoDoJ

pkgname=insync-dolphin
epoch=1
pkgver=r29.de53666
pkgrel=1
pkgdesc="Insync context menus and overlay icons for Dolphin - Plasma 6"
arch=('x86_64')
url="https://github.com/felagund/dolphin-insync-plugin-plasma-6"
license=('GPL-2.0-only')
depends=(
    'insync'
    'dolphin'
)
makedepends=(
    'cmake'
    'extra-cmake-modules'
    'qt6-base'
    'git'
)
provides=('dolphin-insync-plugin-plasma-6')
conflicts=('dolphin-insync-plugin-plasma-6')
source=("${pkgname}::git+https://github.com/felagund/dolphin-insync-plugin-plasma-6.git#branch=master")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build/
    cmake --build build/
}

package() {
    cd "${pkgname}"
    DESTDIR="${pkgdir}" cmake --install build/
}
