# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-heretic
pkgver=6.1.1
pkgrel=1
pkgdesc="A limit-removing source port of Heretic with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('heretic1-wad: Heretic shareware game data')
conflicts=('inter-heretic-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/heretic-${pkgver}.tar.gz")
b2sums=('2675dbb1c3e47cdbcfaa5329b4e8772adee16b32a7c43110a07f38de0c503e9fdbbbe7d59555585df556cd002428c6f990014795d94ab45ca6d4784d377554e4')

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "inter-doom-heretic-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="OFF" \
    -D COMPILE_HERETIC="ON" \
    -D COMPILE_HEXEN="OFF" \
    -D COMPILE_STRIFE="OFF" \
    -D BUILD_VERSION_OVERWRITE="${pkgver}" \
    -D NO_GIT_HASH="ON"
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/inter-doom/GPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -r "${pkgdir}/usr/share/doc"
}
