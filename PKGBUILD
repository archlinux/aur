# Maintainer: Michaël Lhomme <papylhomme at gmail dot com>

pkgname=diskmonitor
pkgver=0.3.1
pkgrel=1
pkgdesc="KDE tools to monitor SMART devices and MDRaid health status"
arch=('i686' 'x86_64')
url="https://github.com/papylhomme/diskmonitor"
license=('GPL2')
provides=('diskmonitor')
conflicts=('diskmonitor')
depends=('udisks2' 'qt5-base' 'kdelibs' 'ki18n' 'kiconthemes' 'plasma-framework' )
makedepends=('cmake' 'extra-cmake-modules' 'git')
options=()
source=( "$pkgname::git+https://github.com/papylhomme/diskmonitor.git#tag=${pkgver}" )
md5sums=( 'SKIP')


build () {
    cd "${srcdir}/${pkgname}"
    [ -e build ] || mkdir build
    cd build
    cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR="${pkgdir}" install
}
