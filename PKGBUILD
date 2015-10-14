# Maintainer: Carlchristian Eckert <carli-eckert at gmx dot de>

pkgname=cpp-elegant-progressbars-git
pkgver=1.0.0
pkgrel=1
_pkgname=${pkgname#cpp-}
_pkgsuffix=for-a-more-civilized-age
pkgdesc="A simple Cpp-11 header library to make elegant progressbars for a more civilized time-progression"
url="http://github.com/slizzered/${_pkgname%-git}-${_pkgsuffix}"
source=("${pkgname}::git://github.com/slizzered/${_pkgname%-git}-${_pkgsuffix}.git")
license=('MIT')
arch=('i686' 'x86_64')
optdepends=('cmake: easily including the progressbars into projects')
makedepends=('git' 'cmake>=3.0.2')
sha256sums=('SKIP')

pkgver(){
    cd ${pkgname}
    RELEASE_MAJOR=$(grep -o "_VERSION_MAJOR [0-9]\+" include/elegant-progressbars/version.hpp | sed 's/[^0-9]//g')
    RELEASE_MINOR=$(grep -o "_VERSION_MINOR [0-9]\+" include/elegant-progressbars/version.hpp | sed 's/[^0-9]//g')
    RELEASE_PATCH=$(grep -o "_VERSION_PATCH [0-9]\+" include/elegant-progressbars/version.hpp | sed 's/[^0-9]//g')
    REVISION=$(git describe --long --tags | sed 's/[0-9.]\+-//;s/\([^-]*-g\)/r\1/;s/-/./g')
    echo ${RELEASE_MAJOR}.${RELEASE_MINOR}.${RELEASE_PATCH}.${REVISION}
}

build(){
    cd ${pkgname}
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package(){
    cd ${pkgname}
    make DESTDIR=${pkgdir} install
}
