# Maintainer: Guilhem Saurel <saurel@laas.fr>

_pkgname=pinocchio
_pkgver=1.2.4
pkgname=${_pkgname}-git
pkgver=1.2.4.r1493.3352afb
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra."
arch=('i686' 'x86_64')
url="https://stack-of-tasks.github.io/pinocchio/"
license=('LGPL3')
depends=('eigen' 'eigenpy' 'urdfdom')
optdepends=('metapod-git' 'lua51' 'hpp-fcl-git')
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
    git checkout devel
    git submodule update --init
}

build() {
    cd "$_pkgname"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_UNIT_TESTS=OFF .
    make
}

package() {
    cd "$_pkgname"
    make DESTDIR="$pkgdir/" install
}
