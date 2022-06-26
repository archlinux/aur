# Maintainer: Jef Roosens

pkgname=yip-git
pkgver=0.1.3.r4.g164de8a
pkgrel=1
pkgdesc="Performant, lightweight HTTP server that echoes the client's IP address, written in plain C. (development version)"
arch=('x86_64')

url='https://github.com/jenspots/yip'
license=('AGPL-3.0')

depends=('glibc')
makedepends=('git' 'cmake')

provides=('yip')
conflicts=('yip')

source=("${pkgname}::git+https://github.com/jenspots/yip#branch=main")
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}
