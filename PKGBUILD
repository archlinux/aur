# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=pinocchio
pkgver=1.1.2
pkgrel=4
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://stack-of-tasks.github.io/pinocchio/"
license=('LGPL3 or any later version')
depends=('eigenpy')
optdepends=('metapod-git' 'urdfdom' 'lua51')
makedepends=('cmake' 'pkg-config')
conflicts=('pinocchio-git')
source=("https://github.com/stack-of-tasks/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b78e6405bafa72210e3e865e658017c7')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS=-std=c++03 -DBUILD_UNIT_TESTS=OFF .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    mv $pkgdir/usr/lib64/* $pkgdir/usr/lib/
    rmdir $pkgdir/usr/lib64
}
