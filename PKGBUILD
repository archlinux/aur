# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=pinocchio
_pkgver=1.2.4
pkgname=${_pkgname}-git
pkgver=$_pkgver.r1448.b927976
pkgrel=2
pkgdesc="Dynamic computations using Spatial Algebra."
arch=('i686' 'x86_64')
url="https://stack-of-tasks.github.io/pinocchio/"
license=('LGPL3')
depends=('eigen32' 'eigenpy' 'hpp-fcl' 'urdfdom')
optdepends=('metapod-git' 'lua51')
makedepends=('cmake' 'git')
conflicts=('pinocchio')
provides=('pinocchio')
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
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_UNIT_TESTS=OFF .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
