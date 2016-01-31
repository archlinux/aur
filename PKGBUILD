# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=kde-thumbnailer-fb2-kf5
pkgname="${_pkgname}-git"
pkgver=20160131
pkgrel=1
pkgdesc="A KDE thumbnail generator for the FictionBook (fb2) file format. KDE KF5 port."
arch=('i686' 'x86_64')
url="https://github.com/FadeMind/${_pkgname}"
license=('GPL')
depends=('ebook-tools' 'kdelibs4support')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdoctools' 'qt5-tools')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
    rm -rf build
    mkdir -p build
}

build() {
    cd ${srcdir}/build
    cmake ../${_pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DSYSCONF_INSTALL_DIR=/etc \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}