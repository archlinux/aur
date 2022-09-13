# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=hpp-util
_pkgver=3.2
pkgname=${_pkgname}-git
pkgver=3.2.r110.c243c61
pkgrel=1
pkgdesc="This package gathers technical tools for the HPP project. Devel branch"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$_pkgname"
license=('GPL3')
depends=('boost' 'tinyxml')
makedepends=('cmake' 'git')
optdepends=('doxygen')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname"::"git://github.com/nim65s/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule update --init
}

build() {
    cd "$_pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
