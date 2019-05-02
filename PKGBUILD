# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=pinocchio
pkgver=2.1.3
pkgrel=1
pkgdesc="Dynamic computations using Spatial Algebra"
arch=('i686' 'x86_64')
url="https://github.com/stack-of-tasks/$pkgname"
license=('BSD')
depends=('hpp-fcl' 'eigenpy' 'urdfdom')
optdepends=('doxygen' 'lua52' 'cppad' 'cppadcodegen')
makedepends=('cmake' 'eigen')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cd "$pkgname-$pkgver"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib \
        -DBUILD_WITH_AUTODIFF_SUPPORT=ON -DBUILD_WITH_COLLISION_SUPPORT=ON .
    make
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING.LESSER "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
