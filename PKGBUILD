# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=hpp-statistics
_pkgver=1.1
pkgname=${_pkgname}-git
pkgver=1.1.r58.fe1a714
pkgrel=1
pkgdesc="This package is part of the HPP software and provides a few tools for basic statistics. Devel branch."
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$_pkgname"
license=('GPL3')
depends=('hpp-util-git')
makedepends=('cmake' 'git')
optdepends=('doxygen')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname"::"git://github.com/humanoid-path-planner/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule update --init
    git checkout devel
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
