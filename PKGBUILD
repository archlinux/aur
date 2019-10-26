# Author: mosra <mosra@centrum.cz>
pkgname=magnum-integration-git
pkgver=2019.10.r0.g5e103b5
pkgrel=1
pkgdesc="Integration libraries for the Magnum C++11/C++14 graphics engine (Git version)"
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'bullet' 'eigen' 'glm')
makedepends=('cmake' 'git')
provides=('magnum-integration')
conflicts=('magnum-integration')
source=("git+git://github.com/mosra/magnum-integration.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    cmake "$srcdir/${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_BULLET=ON \
        -DWITH_EIGEN=ON \
        -DWITH_GLM=ON \
        -DWITH_DART=OFF \
        -DWITH_IMGUI=OFF
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install
}
