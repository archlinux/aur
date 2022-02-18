# Maintainer: Maxim Kolesnikov <indev.src at gmail dot com>
pkgname=ppconsul-git
pkgver=0.2.3.r7.g1a889ce
pkgrel=1
pkgdesc="C++ client for Consul"
arch=('any')
url="https://github.com/oliora/ppconsul"
license=('Boost')
depends=('curl>7.00')
makedepends=('boost>1.55' 'cmake' 'git')
conflicts=(ppconsul)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
            
pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S"${pkgname}" -Bbuild \
        -DBUILD_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" cmake --build . --target install
}
