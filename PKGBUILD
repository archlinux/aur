# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=hpp-model
_pkgver=3.2
pkgname=${_pkgname}-git
pkgver=3.2.r412.e364f9c
pkgrel=1
pkgdesc="Implementation of kinematic chains with geometry"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('LGPL3')
depends=('eigen32' 'hpp-util-git' 'hpp-fcl-git')
optdepends=('assimp')
makedepends=('cmake')
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
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
