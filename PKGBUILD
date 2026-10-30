# Maintainer: Leonid Murin (Dasperal) <Dasperal1 at gmail dot com>
pkgname=inter-doom
pkgver=9.1
pkgrel=1
pkgdesc="International Doom. Small, functional and simple Doom, Heretic, Hexen source port, created with help, efforts and bits of code from people around the world"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/JNechaevsky/international-doom"
license=('GPL-2.0-only')
depends=('hicolor-icon-theme'
         'glibc'
         'sdl2>=2.0.18'
         'sdl2_mixer>=2.0.2'
         'libsamplerate'
         'fluidsynth')
makedepends=(cmake)
optdepends=('doom1-wad: Doom shareware game data'
            'heretic1-wad: Heretic shareware game data'
            'hexen1-wad: Hexen demo game data')
provides=("inter-heretic=${pkgver}"
          "inter-hexen=${pkgver}")
conflicts=('inter-heretic'
           'inter-hexen'
           'inter-doom-git'
           'inter-heretic-git'
           'inter-hexen-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JNechaevsky/international-doom/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f950f1161a0b5a211f06d231dc575f70d1715f693a74e02e618f9da18dc628efa503d519b876f94d35dfe1b1c7ba7ffcd4f9f0dd3d0fb1ec162d7100986d1d4c')

build() {
    cmake -S "international-doom-${pkgver}" -B "international-doom-${pkgver}/build" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D CMAKE_C_FLAGS_RELEASE="-O2 -mtune=generic -flto -fno-math-errno -fomit-frame-pointer -funroll-loops -DNDEBUG" \
    -D CMAKE_INSTALL_PREFIX="/usr"
    cmake --build "international-doom-${pkgver}/build" --config Release
}

package() {
    DESTDIR="${pkgdir}" cmake --install "international-doom-${pkgver}/build"

    install -Dm644 "international-doom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "international-doom-${pkgver}/data/doom.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-doom.png"
    install -Dm644 "international-doom-${pkgver}/data/doom.desktop" "${pkgdir}/usr/share/applications/inter-doom.desktop"

    install -Dm644 "international-doom-${pkgver}/data/heretic.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-heretic.png"
    install -Dm644 "international-doom-${pkgver}/data/heretic.desktop" "${pkgdir}/usr/share/applications/inter-heretic.desktop"

    install -Dm644 "international-doom-${pkgver}/data/hexen.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/inter-hexen.png"
    install -Dm644 "international-doom-${pkgver}/data/hexen.desktop" "${pkgdir}/usr/share/applications/inter-hexen.desktop"
}
