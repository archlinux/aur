# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=pinocchio
_pkgver=1.1.2
pkgname=${_pkgname}-git
pkgver=${_pkgver}.r1010.50f3e32
pkgrel=3
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://stack-of-tasks.github.io/pinocchio/"
license=('LGPL3 or any later version')
depends=('eigenpy')
optdepends=('metapod-git' 'urdfdom' 'lua51')
makedepends=('cmake' 'pkg-config' 'git')
conflicts=('pinocchio')
source=("$_pkgname"::"git://github.com/stack-of-tasks/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git checkout devel
    git submodule update --init
}

build() {
    cd "$_pkgname"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/lib \
        -DCMAKE_CXX_FLAGS=-std=c++03 -DBUILD_UNIT_TESTS=OFF .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
