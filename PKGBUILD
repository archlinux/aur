# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-hexen
pkgver=6.0
pkgrel=1
pkgdesc="A limit-removing source port of Hexen with enhancements and translation to the Russian language"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/inter-doom"
license=('GPL2')
depends=('sdl2>=2.0.18' 'sdl2_mixer>=2.0.2' 'sdl2_net>=2.0.0' 'libsamplerate')
makedepends=(cmake python3)
optdepends=('hexen1-wad: Hexen demo game data')
conflicts=('inter-hexen-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/inter-doom/archive/refs/tags/hexen-${pkgver}.tar.gz")
b2sums=('0044145b92f1adb5e72d9fb45282d699b03feb431179bbdf20a91de69dd28c4701f8ecf8d0988dc16b46d37881fc10038c02f6363e6433b9abc6fcf3543380f0')

build() {
    # Upstream forces `-O2` for 'Release' build type
    cmake -S "inter-doom-hexen-${pkgver}" -B build \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D COMPILE_DOOM="OFF" \
    -D COMPILE_HERETIC="OFF" \
    -D COMPILE_HEXEN="ON" \
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
