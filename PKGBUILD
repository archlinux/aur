# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=rkcommon-git
pkgver=1.5.1.r0.gab6835b
pkgrel=1
pkgdesc='Intel RenderKit common C++/CMake infrastructure (git version)'
arch=('x86_64')
url='https://github.com/ospray/rkcommon/'
license=('Apache')
depends=('tbb')
makedepends=('git' 'cmake')
source=('git+https://github.com/ospray/rkcommon.git')
sha256sums=('SKIP')

pkgver() {
    git -C rkcommon describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S rkcommon \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -W-nodev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
