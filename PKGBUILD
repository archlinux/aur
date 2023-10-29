# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=russian-doom
pkgver=6.3
pkgrel=1
pkgdesc="A limit-removing source port of Doom, Heretic and Hexen with enhancements and Russian translation"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Russian-Doom/russian-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('doom1-wad: Doom shareware game data' 'heretic1-wad: Heretic shareware game data' 'hexen1-wad: Hexen demo game data')
conflicts=('russian-doom-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Russian-Doom/russian-doom/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('fa252f3fc1103eb50b9f202809cc9a400c49d698b2daee61d37e8b8a0084ade7d048b522c06675197774bf772b53a0e040af8c1c0d6ba7d4a777e980444f674d')

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "${pkgname}-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D RD_BUILD_VERSION_OVERWRITE="${pkgver}" \
    -D RD_GIT_NO_HASH="ON"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/${pkgname}/GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
