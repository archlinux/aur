# Maintainer: mi544 (sd32 at protonmail.com)

pkgname=gummy
pkgver=0.3
pkgrel=1
pkgdesc="Linux brightness/temperature manager for X11"
arch=('x86_64')
url="https://github.com/Fushko/$pkgname"
license=('GPL3')
depends=('libxext' 'libxcb' 'sdbus-cpp' 'libudev.so')
makedepends=('git' 'cmake')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("git+$url#tag=$pkgver")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE="Release"
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="${pkgdir}" install
}
