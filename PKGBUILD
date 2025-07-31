# Maintainer: Kirill Tikhomirov <kirill2980440@gmail.com>
pkgname=libretro-xmil-git
pkgver=r286.6a52dc2
pkgrel=1
pkgdesc="Sharp X1 core for libretro"
arch=('x86_64' 'aarch64')
url="https://github.com/libretro/xmil-libretro"
license=('BSD-3-Clause')
groups=('libretro')
depends=('glibc')
makedepends=('git')
provides=('libretro-xmil')
conflicts=('libretro-xmil')
source=('git+https://github.com/libretro/xmil-libretro.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/xmil-libretro"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/xmil-libretro/libretro"
    make -f Makefile.libretro clean
    make -f Makefile.libretro
}

package() {
    cd "${srcdir}/xmil-libretro/libretro"
    install -Dm644 x1_libretro.so "${pkgdir}/usr/lib/libretro/x1_libretro.so"
}

