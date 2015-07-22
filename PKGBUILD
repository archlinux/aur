# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=kdevelop-pg-qt-git
pkgver=v1.0.0.r24.g83be916
pkgrel=1
pkgdesc='KDevelop Parser Generator as used in e.g. the PHP language plugin and others'
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevelop-git')
makedepends=('cmake' 'git')
provides=('kdevelop-pg-qt')
conflicts=('kdevelop-pg-qt')
source=('git://anongit.kde.org/kdevelop-pg-qt')
md5sums=('SKIP')

pkgver() {
    cd kdevelop-pg-qt
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../kdevelop-pg-qt \
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
