# Maintainer: OverMighty <its.overmighty@gmail.com>
pkgname=i-use-arch-btw-git
pkgver=0.1.0.r14.c511373
pkgrel=1
pkgdesc="Turing-complete programming language"
arch=('x86_64')
url="https://github.com/overmighty/i-use-arch-btw"
license=('GPL3')
makedepends=('cmake' 'git')
source=("${pkgname%-git}::git+https://github.com/overmighty/i-use-arch-btw.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake \
        -S . \
        -B build \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    DESTDIR="$pkgdir" cmake --install build
}
