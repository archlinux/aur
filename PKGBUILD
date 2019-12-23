# Maintainer: Emerson Max de Medeiros Silva <emersonmx@gmail.com>
pkgname=libretro-sameboy-git
pkgver=1040.da29506
pkgrel=1
pkgdesc='Nintendo Game Boy/Game Boy Color core'
arch=('x86_64')
url='https://github.com/libretro/SameBoy'
license=('MIT')
groups=('libretro')
depends=('libretro-core-info')
makedepends=('git' 'clang' 'sdl2' 'rgbds')
_libname=sameboy_libretro
source=("$pkgname::git+https://github.com/libretro/SameBoy.git#commit=da29506")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"

    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    CC=clang make -f Makefile libretro
}

package() {
    cd "$pkgname"

    install -Dm644 "$srcdir/$pkgname/build/bin/$_libname.so" \
        "$pkgdir/usr/lib/libretro/$_libname.so"
}
