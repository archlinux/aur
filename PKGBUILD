# Maintainer: Zhirui Dai <daizhirui@hotmail.com>

pkgname=ksvg-git
_name=${pkgname%-git}
pkgver=r5057.9ba4b20b
pkgrel=1
pkgdesc='A library for rendering SVG-based themes with stylesheet re-coloring and on-disk caching'
arch=(x86_64)
url='https://projects.kde.org/projects/playground/libs/plasma-framework'
license=(LGPL)
depends=(qt6-base qt6-tools karchive-git kconfig-git kcolorscheme-git kcoreaddons-git kirigami2-git)
makedepends=(git cmake extra-cmake-modules-git)
source=("git+https://invent.kde.org/frameworks/$_name.git")
conflicts=(ksvg)
provides=(ksvg)
sha256sums=('SKIP')

pkgver() {
    cd $_name
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S $_name -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
