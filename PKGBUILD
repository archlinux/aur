# Maintainer: Zhirui Dai <daizhirui@hotmail.com>

pkgname=ksvg-git
_name=${pkgname%-git}
pkgver=r5156.aff7a5e0
pkgrel=1
pkgdesc='A library for rendering SVG-based themes with stylesheet re-coloring and on-disk caching'
arch=(x86_64)
url='https://projects.kde.org/projects/playground/libs/plasma-framework'
license=(LGPL)
depends=(
    gcc-libs
    glibc
    karchive
    kcolorscheme
    kconfig
    kguiaddons
    qt6-base 
    qt6-svg
)
makedepends=(
    doxygen
    extra-cmake-modules
    kirigami
    qt6-declarative
    qt6-doc
    qt6-tools
    git
)
optdepends=(
    'kirigami: QML bindings'
    'qt6-declarative: QML bindings'
)
source=("git+https://invent.kde.org/frameworks/$_name.git")
conflicts=(ksvg)
provides=(ksvg)
sha256sums=('SKIP')

pkgver() {
    cd $_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S $_name -DCMAKE_BUILD_TYPE=Release -DBUILD_QCH=ON -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
