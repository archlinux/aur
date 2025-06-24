# Maintainer: aquova <mail at aquova dot net>

pkgname=iris-emu
pkgver=0.10a
_pkgver=0.10-alpha
pkgrel=1
pkgdesc="Experimental PlayStation 2 Emulator"
arch=("x86_64")
url="https://github.com/allkern/iris"
license=("MIT")
depends=("sdl2")
makedepends=("git" "make" "python")
source=(
    "iris::git+${url}.git#tag=${_pkgver}"
    "iris-emu.desktop"
)
sha256sums=(
    "SKIP"
    "6dfc8a9ccf3229c52dea374de1697e2dc1084fcc237bc632d2a7c58246610304"
)

prepare() {
    cd $srcdir/iris
    git submodule update --init --recursive
}

build() {
    cd $srcdir/iris/gl3w
    python gl3w_gen.py
    cd ..
    make -j$(nproc)
}

package() {
    install -Dm755 $srcdir/iris/bin/iris $pkgdir/usr/bin/iris-emu
    install -Dm644 $srcdir/iris/res/iris.png $pkgdir/usr/share/pixmaps/iris-emu.png
    install -Dm644 $srcdir/iris-emu.desktop -t $pkgdir/usr/share/applications
}
