# Maintainer: aquova <mail at aquova dot net>

pkgname=tanuki3ds
pkgver=0.3.1
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
    "d43677593e293f3614648ced743db5dc762d56facfdde7457066a05a4e36fe54"
    "1e15778ca01e327a0dc4f51a13111b590afac1aeb23102f109e7b8733460abcb"
    "c2cb252082d514fe6e199f57de135dd68aab64a73bac181d1b9bcac6e6b390c4"
)

build() {
    cd $srcdir/Tanuki3DS-${pkgver}
    patch -uN Makefile $srcdir/Makefile.patch || return 1
    make
}

package() {
    cd $srcdir/Tanuki3DS-${pkgver}
    install -Dm755 ctremu $pkgdir/usr/bin/ctremu
    install -Dm644 $srcdir/Tanuki3DS.desktop $pkgdir/usr/share/applications/Tanuki3DS.desktop
    install -Dm644 images/logo.png $pkgdir/usr/share/icons/hicolor/512x512/apps/tanuki3ds.png
}
