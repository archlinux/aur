# Maintainer: technician <spacedreams@gmx.com>

pkgname=pc6001vx
pkgver=v3.9.0
_pkgver=3.9.0
pkgrel=1
pkgdesc="Cross platform version of NEC PC-6001 emulator based on PC6001V"
arch=('i686' 'x86_64')
url="https://github.com/eighttails/PC6001VX"
license=('LGPL2.1')
depends=('libx11' 'mesa' 'ffmpeg' 'sdl2' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras')
makedepends=('git')
provides=('pc6001vx')
conflicts=('pc6001vx')
source=("https://github.com/eighttails/PC6001VX/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('70fea925e20d3214c52859fab72e29266b6ba6138564a7b1376425c7b0070011ee40d1a23c8bd83c8fd50f4fa89970c0a6c58accc4ce6468987ef63333058d6d')
options=(!buildflags)

prepare() {
    cd "$srcdir/PC6001VX-$_pkgver"
    mkdir -p build
}

build() {
    export CFLAGS=" -Wno-error=format-security"

    cd "$srcdir/PC6001VX-$_pkgver/build"
    qmake "$srcdir/PC6001VX-$_pkgver/PC6001VX.pro"
    make
}

package() {
    install -Dm755 "$srcdir/PC6001VX-$_pkgver/build/PC6001VX" "$pkgdir/usr/bin/PC6001VX"
    install -Dm644 "$srcdir/PC6001VX-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/PC6001VX/LICENSE"
}
