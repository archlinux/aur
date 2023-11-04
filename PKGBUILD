# Maintainer: DigitOtter <digitotter@protonmail.com>
pkgname=obs-plugin-texture-share-vk-git
pkgver=v0.1.0.r2.g9fecc45
pkgrel=1
pkgdesc="Remote texture sharing plugin for OBS"
arch=( 'any' )
url='https://github.com/DigitOtter/obs-plugin-texture-share-vk'
license=( 'GPL' )
groups=()
depends=( 'obs-studio' 'texture-share-vk' )
makedepends=( 'qt6-base' 'git' 'cmake' 'gcc' )
provides=( 'obs-plugin-texture-share-vk' )
conflicts=(  'obs-plugin-texture-share-vk' )
source=( "${pkgname}::git+https://github.com/DigitOtter/obs-plugin-texture-share-vk.git#branch=master" )
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

