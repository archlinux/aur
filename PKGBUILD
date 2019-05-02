# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=hpp-fcl
pkgver=1.0.2
pkgrel=1
pkgdesc="An extension of the Flexible Collision Library"
arch=('i686' 'x86_64')
url="https://github.com/humanoid-path-planner/$pkgname"
license=('BSD')
depends=('assimp')
optdepends=('doxygen' 'octomap')
makedepends=('eigen')
makedepends=('cmake')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
md5sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    cd "$pkgname-$pkgver"

    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
    make
}

check() {
    cd "$pkgname-$pkgver"
    make test
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
