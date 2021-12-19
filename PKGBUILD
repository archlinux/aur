# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=qdre-git
pkgver=0.0.0.r55.gfdcd2eb
pkgrel=1
pkgdesc='Contains lightweight X11 compositor and image viewer'
arch=('x86_64')
url='https://gitlab.com/zaps166/qdre'
license=('MIT')
groups=('qdre')
depends=('qt5-base' 'qt5-x11extras' 'glib2' 'gnome-menus' 'exiv2' 'kcrash' 'kwindowsystem' 'libxcb')
makedepends=('fakeroot' 'make' 'gcc' 'cmake' 'git')
optdepends=('drkonqi')
# options=(!strip debug)
source=("git+https://gitlab.com/zaps166/qdre.git#branch=master")
sha1sums=("SKIP")

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
        -DCMAKE_BUILD_TYPE=Release
    make
}

# check() {
#     cd build
#     ctest -V
# }

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
