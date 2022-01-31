# Maintainer: Maksim Verkhoturov (sd32@protonmail.com)

pkgname=gummy-git
pkgver=0.1.r19.g15a13c2
pkgrel=1
pkgdesc="Linux brightness/temperature manager for X11"
arch=('x86_64')
url="https://github.com/Fushko/${pkgname%-git}"
license=('GPL3')
depends=('libxext' 'sdbus-cpp')
makedepends=('git' 'cmake')
provides=("$pkgname")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -B build \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE="Release"
    cmake --build build
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="${pkgdir}" install
}
