# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=pinocchio-git
_pkgver=1.1.2
pkgver=$_pkgver.r1010.50f3e32
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://stack-of-tasks.github.io/pinocchio/"
license=('LGPL3 or any later version')
depends=('eigenpy')
optdepends=('metapod-git' 'urdfdom' 'lua51')
makedepends=('cmake' 'gcc5' 'git')
conflicts=('pinocchio')
source=("$pkgname"::"https://github.com/stack-of-tasks/${pkgname/-/.}")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo "$_pkgver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git checkout devel
    git submodule update
}

build() {
    cd "$pkgname"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS=-std=c++03 -DBUILD_UNIT_TESTS=OFF .
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir/" install
}
