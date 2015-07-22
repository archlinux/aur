# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: mosra <mosra@centrum.cz>

pkgname=kdevelop-qmake-git
pkgver=779.1330892
pkgrel=1
pkgdesc="KDevelop Plugin for qmake support"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git')
makedepends=('cmake' 'git' 'kdevelop-pg-qt-git')
provides=('kdevelop-qmake')
conflicts=('kdevelop-qmake')
source=('git://anongit.kde.org/kdev-qmake')
md5sums=('SKIP')

pkgver() {
    cd kdev-qmake
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    mkdir -p build
    cd build

    cmake ../kdev-qmake \
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

    # Remove conflicts with kapptemplate
    rm "${pkgdir}"/usr/share/kdevappwizard/templates/qmake_qt4guiapp.tar.bz2
}
