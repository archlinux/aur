pkgname=mupen64plus-video-gliden64
pkgver=4.0
_pkgver=4_0
pkgrel=1
pkgdesc="A new generation, open-source graphics plugin for N64 emulators"
arch=('i686' 'x86_64')
url="https://github.com/gonetz/GLideN64"
license=('GPL')
depends=('mupen64plus')
makedepends=('cmake' 'boost')
source=(https://github.com/gonetz/GLideN64/archive/Public_Release_${_pkgver}.tar.gz)
sha256sums=('6b379cf109433527155b479d67a32c903bf074003907bea26de224a573501af6')

build() {
    cd "$srcdir/GLideN64-Public_Release_$_pkgver/src"

    echo "#define PLUGIN_REVISION \"${pkgver}\"" > "Revision.h"

    cmake -D MUPENPLUSAPI=On CMakeLists.txt
    make
}

package() {
    cd "$srcdir/GLideN64-Public_Release_$_pkgver/src/plugin/Release"

    install -Dm644 "mupen64plus-video-GLideN64.so" "$pkgdir/usr/lib/mupen64plus/mupen64plus-video-GLideN64.so"
}
