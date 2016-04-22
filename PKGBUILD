# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=breeze-icons
pkgname="${_pkgname}-git"
pkgver=5.21.0.r57.g7160ed6
pkgrel=1
pkgdesc="Breeze icon themes for KDE Plasma. (GIT version)"
arch=('any')
url="https://quickgit.kde.org/?p=${_pkgname}.git"
license=('LGPL')
groups=('kf5')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-base')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git://anongit.kde.org/${_pkgname}.git")
sha256sums=('SKIP')

pkgver(){
    cd ${srcdir}/${_pkgname}
    git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

prepare() {
    rm -rf build
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
