# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=qdre-git
pkgver=07628fa
pkgrel=1
pkgdesc='Qt Desktop Regular Environment (early development)'
arch=('i686' 'x86_64' 'armv7h')
url='https://gitlab.com/zaps166/qdre'
license=('MIT')
groups=('qdre')
depends=('qt5-base' 'qt5-x11extras' 'glib2' 'gnome-menus' 'libgtop' 'exiv2' 'kcrash' 'kwindowsystem' 'qrencode' 'libxcb')
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
    git rev-parse --short HEAD
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
