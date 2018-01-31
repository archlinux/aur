pkgname=mupen64plus-video-gliden64
pkgver=3.0
_pkgver=3_0
pkgrel=1
pkgdesc="A new generation, open-source graphics plugin for N64 emulators"
arch=('i686' 'x86_64')
url="https://github.com/gonetz/GLideN64"
license=('GPL')
depends=('mupen64plus')
makedepends=('cmake' 'boost')
source=(https://github.com/gonetz/GLideN64/archive/Public_Release_${_pkgver}.tar.gz)
sha256sums=('65138b9bdf81c519f040ad907608df293825af5cac02a0ca68e8e0cce1046843')

build() {
    cd "$srcdir/GLideN64-Public_Release_$_pkgver/src"

    echo "#define PLUGIN_REVISION \"${pkgver}\"" > "Revision.h"

    cmake -D MUPENPLUSAPI=On CMakeLists.txt
    make
}

package() {
    cd "$srcdir/GLideN64-Public_Release_$_pkgver/src/plugin/release"

    install -Dm644 "mupen64plus-video-GLideN64.so" "$pkgdir/usr/lib/mupen64plus/mupen64plus-video-GLideN64.so"
}
