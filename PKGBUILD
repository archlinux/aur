# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdevelop-qmljs-git
pkgver=470.a653e4f
pkgrel=1
pkgdesc="KDevelop Plugin for QML/JS Language Support"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git')
makedepends=('cmake' 'git')
provides=('kdevelop-qmljs')
conflicts=('kdevelop-qmljs')
source=('git://anongit.kde.org/kdev-qmljs')
md5sums=('SKIP')

pkgver() {
    cd kdev-qmljs
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    mkdir -p build
    cd build

    cmake ../kdev-qmljs \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_INSTALL_DIR=lib \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
        -DBUILD_TESTING=OFF
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
