# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=qdre-compositor-git
pkgver=0.0.0.r74.g0fa5c11
pkgrel=1
pkgdesc='Lightweight X11 compositor with dconf settings'
arch=('x86_64')
url='https://gitlab.com/zaps166/qdre'
license=('MIT')
groups=('qdre')
depends=('qt6-base' 'glib2' 'libxcb')
makedepends=('cmake' 'git')
conflicts=('qdre-git')
source=("git+https://gitlab.com/zaps166/qdre.git#branch=master")
sha1sums=('SKIP')

prepare() {
    mkdir -p build
}

pkgver() {
    cd qdre
    echo -n "0.0.0.r$(git rev-list --all --count).g$(git rev-parse --short HEAD)"
}

build() {
    cd build
    cmake ../qdre \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release \
        -DAPPS_QDRE_Viewer=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/include"
    rm -r "${pkgdir}/usr/lib"
}
