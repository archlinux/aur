# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=hpp-fcl
_pkgver=0.5
pkgname=${_pkgname}-git
pkgver=0.5.r538.5641ae1
pkgrel=2
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('BSD 3-clause')
depends=('eigen' 'assimp')
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
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
