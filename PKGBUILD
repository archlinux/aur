# Maintainer: Francois Menning <f.menning@pm.me>

_gitname=Breeze10
pkgname=breeze10-kde-git
pkgver=r20.18edb47
pkgrel=1
pkgdesc='A Windows 10 style windows decoration for KDE Plasma'
arch=('i686' 'x86_64')
url='https://github.com/fauzie811/Breeze10'
license=('GPL3')
depends=('plasma-desktop')
makedepends=('git' 'extra-cmake-modules')
provides=('breeze10-kde')
conflicts=('breeze10-kde')
source=("git+https://github.com/fauzie811/Breeze10.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p build
}

build() {
    cd build   
    cmake ../${_gitname} \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DKDE_INSTALL_LIBDIR=lib \
        -DBUILD_TESTING=OFF \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}