# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=gepetto-viewer-corba
pkgver=5.5.1
pkgrel=2
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$pkgname"
license=('BSD')
depends=('gepetto-viewer' 'python-omniorbpy')
makedepends=('cmake' 'boost')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('SKIP' 'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

build() {
    mkdir -p "$pkgname-$pkgver/build"
    cd "$pkgname-$pkgver/build"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib ..
    make
}

check() {
    cd "$pkgname-$pkgver/build"
    make test
}

package() {
    cd "$pkgname-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
