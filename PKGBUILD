# Maintainer: Emerson Max de Medeiros Silva <emersonmx@gmail.com>
_gitname=SameBoy

pkgname=libretro-sameboy-git
pkgver=1051.c9e547c
pkgrel=1
pkgdesc='Nintendo Game Boy/Game Boy Color core'
arch=('x86_64')
url="https://github.com/libretro/$_gitname"
license=('MIT')
groups=('libretro')
depends=('libretro-core-info')
makedepends=('git' 'clang' 'sdl2' 'rgbds')
_libname=sameboy_libretro
source=("git+https://github.com/libretro/$_gitname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"
    CC=clang make -f Makefile libretro
}

package() {
    cd "$_gitname"
    install -Dm644 "$srcdir/$_gitname/libretro/$_libname.so" \
        "$pkgdir/usr/lib/libretro/$_libname.so"
}
