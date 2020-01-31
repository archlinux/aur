# Author: mosra <mosra@centrum.cz, modified for the monopticon project by CarloMara. Co-mantained with synnick>
pkgname=monopticon-magnum-integration
pkgver=2019.10.r32.gb3e2f7f
pkgrel=1.8
pkgdesc="Monopticon version of Integration libraries for the Magnum C++11/C++14 graphics engine (Git version) "
arch=('i686' 'x86_64')
url="https://magnum.graphics"
license=('MIT')
depends=('magnum-git' 'bullet' 'eigen' 'glm' 'imgui-src')
makedepends=('cmake' 'git')
provides=('monopticon-magnum-integration')
conflicts=('monopticon-magnum-integration')
source=("git+git://github.com/mosra/magnum-integration.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/magnum-integration"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    mkdir -p "$srcdir/magnum-integration/build"
    cd "$srcdir/magnum-integration/build"

    cmake "$srcdir/magnum-integration" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DWITH_BULLET=ON \
        -DWITH_EIGEN=ON \
        -DWITH_GLM=ON \
        -DWITH_DART=OFF \
        -DWITH_IMGUI=ON \
        -DIMGUI_DIR=/opt/imgui .. 
    cmake --build .
}

package() {
    cd "$srcdir/magnum-integration/build"
    make DESTDIR="$pkgdir/" install
}
