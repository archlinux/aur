# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: Dan Vratil <vratil at progdansoft dot com>

pkgname=tepsonic-git
_gitname=tepsonic
pkgver=0.8c2f60b
pkgrel=1
pkgdesc="A simple, lightweight audio player written in C++ and Qt that supports collections"
url="http://danvratil.github.io/TepSonic/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'phonon-qt5' 'taglib' 'libqxt')
makedepends=('git' 'cmake' 'qt5-tools')
source=(${_gitname}::git+https://github.com/danvratil/TepSonic)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    # dirty hack since it has no stable releases or tags
    local ver=$(git describe --always | sed 's|-|.|g')
    printf "0.%s" "${ver}"
}

prepare() {
    rm -rf "${srcdir}/build"
    mkdir "${srcdir}/build"
}

build() {
    cd "${srcdir}/build"
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../"${_gitname}"
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
}


