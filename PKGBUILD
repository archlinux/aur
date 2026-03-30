# Maintainer: aquova <mail at aquova dot net>

pkgname=tanuki3ds
pkgver=0.5.0
pkgrel=1
pkgdesc="3DS Emulator"
url="https://github.com/burhanr13/Tanuki3DS"
arch=("x86_64")
license=("GPL3")
depends=('sdl3' 'capstone' 'cglm' 'libfdk-aac' 'xbyak' 'xxhash')
makedepends=('clang')
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "Tanuki3DS.desktop"
    "Makefile.patch"
)
sha256sums=(
    "fac479fe860515d19e2d4a90a210cd97bdda29b422ef84e6f6cdb40b1540f954"
    "1e15778ca01e327a0dc4f51a13111b590afac1aeb23102f109e7b8733460abcb"
    "525b3b90dd1bfb2e851c8483c42bd33f133a62a4bf8ac80bf3b017da8e132132"
)

build() {
    cd $srcdir/Tanuki3DS-${pkgver}
    patch -uN Makefile $srcdir/Makefile.patch || return 1
    make
}

package() {
    cd $srcdir/Tanuki3DS-${pkgver}
    install -Dm755 build/ctremu $pkgdir/usr/bin/ctremu
    install -Dm644 $srcdir/Tanuki3DS.desktop $pkgdir/usr/share/applications/Tanuki3DS.desktop
    install -Dm644 images/logo.png $pkgdir/usr/share/icons/hicolor/512x512/apps/tanuki3ds.png
}
