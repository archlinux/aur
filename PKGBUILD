# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=gepetto-viewer
pkgver=4.11.0
pkgrel=4
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$pkgname"
license=('BSD')
depends=('openscenegraph' 'urdfdom' 'osgqt' 'boost')
makedepends=('cmake' 'boost' 'urdfdom')
optdepends=('openscenegraph-dae: load DAE files')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28' 'A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
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
