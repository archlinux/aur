# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=hpp-model-urdf
_pkgver=3.2
pkgname=${_pkgname}-git
pkgver=3.2.r166.c6eff38
pkgrel=1
pkgdesc="Implements a library that allows you to load an hpp-model robot by parsing an urdf robot model file."
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('LGPL3')
depends=('assimp' 'hpp-util-git' 'hpp-model-git' 'urdf-git' 'resource-retriever' 'urdfdom' 'srdfdom-git')
makedepends=('cmake')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname"::"git://github.com/nim65s/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$_pkgname"
    git submodule update --init
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
