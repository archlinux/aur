# Maintainer: Nick Skelsey <nskelsey@gmail.com>
pkgname=monopticon
pkgver=0.3.3
pkgrel=3
pkgdesc="Ethernet traffic visualizer for zeek"
arch=('x86_64')
url="https://github.com/nskelsey/monopticon"
license=('GPL')
depends=("zeek" "magnum-git" "corrade-git" "magnum-plugins-git" "imgui-src" "monopticon-magnum-integration")
source=("git+https://github.com/nskelsey/monopticon")
md5sums=('SKIP')

build() {
    cd "$srcdir/monopticon"
    mkdir -p build
    cd build
    cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBROKER_ROOT_DIR=/opt/zeek \
      -DIMGUI_DIR=/opt/imgui/ ..
    cmake --build .
}

package() {
    cd "$srcdir/monopticon/build"
    make DESTDIR="$pkgdir/" install
}
