# Maintainer: DigitOtter <digitotter@protonmail.com>
pkgname=obs-scene-tree-view-git
pkgver=v0.1.3.r0.ge2f0f6d
pkgrel=1
pkgdesc="Scene Tree Folder plugin for OBS Studio"
arch=( 'any' )
url='https://github.com/DigitOtter/obs_scene_tree_view.git'
license=( 'GPL' )
groups=()
depends=( 'obs-studio' )
makedepends=( 'qt5-base' 'git' 'cmake' 'gcc' )
provides=( 'obs-scene-tree-view' )
conflicts=(  'obs-scene-tree-view' )
source=( "${pkgname}::git+https://github.com/DigitOtter/obs_scene_tree_view.git#branch=master" )
sha256sums=( 'SKIP' )

pkgver() {
    cd "${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

