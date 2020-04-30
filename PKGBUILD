# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=gepetto-viewer
pkgver=4.9.0
pkgrel=2
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$pkgname"
license=('BSD')
depends=('openscenegraph' 'urdfdom' 'openthreads' 'osgqt' 'boost')
makedepends=('cmake' 'boost' 'urdfdom')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig}
    "$url/commit/7558dda.patch")
sha256sums=('SKIP' 'SKIP' '2b2c888f4ae8107f7e630c918db956deed84283425290d2dcf39a4df796f040b')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28')

prepare() {
    cd "$pkgbase-$pkgver"
    patch -p1 -i "$srcdir/7558dda.patch"
}

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
