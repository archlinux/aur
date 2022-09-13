# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=hpp-pinocchio
_pkgver=4.0.1
pkgname=${_pkgname}-git
pkgver=4.0.1.r177.338bb77
pkgrel=1
pkgdesc="Refactoring of hpp-model using the kinematic tree of pinocchio"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$_pkgname"
license=('LGPL3')
depends=('boost' 'pinocchio' 'assimp' 'hpp-util-git' 'hpp-fcl' 'resource-retriever')
optdepends=('hpp-model' 'hpp-model-urdf' 'romeo_description' 'hpp_environments' 'doxygen')
makedepends=('cmake' 'git')
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
