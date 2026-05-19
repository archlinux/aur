# Maintainer: x12 <x12@archlinux>
pkgname=nytrogen-git
pkgver=0.1.r158.gb39826a
pkgrel=1
pkgdesc="A lightweight systems programming language and compiler built from scratch"
arch=('x86_64')
url="https://github.com/X12-Cloud/Nytrogen"
license=('GPL3')
depends=('glibc')
makedepends=('cmake' 'git' 'gcc' 'lua54')
optdepends=('nasm: Required for assembling x86_64 output'
            'ld: Required for linking object files')
provides=('nytrogen')
conflicts=('nytrogen')

source=("Nytrogen::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/Nytrogen"
    printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/Nytrogen"

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLUA_INCLUDE_DIR=/usr/include/lua5.4 \
        -DLUA_LIBRARY=/usr/lib/liblua5.4.so
    cmake --build build
}

package() {
    cd "${srcdir}/Nytrogen"
    DESTDIR="${pkgdir}" cmake --install build
}
