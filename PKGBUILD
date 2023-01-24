# Maintainer: Guilhem Saurel <saurel@laas.fr>

pkgname=gepetto-viewer
pkgver=4.15.1
pkgrel=1
pkgdesc="Graphical Interface for Pinocchio and HPP."
arch=('i686' 'x86_64')
url="https://github.com/gepetto/$pkgname"
license=('BSD')
depends=('openscenegraph' 'urdfdom' 'osgqt' 'boost')
makedepends=('cmake' 'boost' 'urdfdom')
optdepends=('openscenegraph-dae: load DAE files')
source=($url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('2efd27e4653f793b96ed3ce4914a8f605596f42799db88ac796a058ac7d5d2dc'
            'SKIP')
validpgpkeys=('9B1A79065D2F2B806C8A5A1C7D2ACDAF4653CF28' 'A031AD35058955293D54DECEC45D22EF408328AD')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
