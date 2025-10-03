# Maintainer: Guilhem Saurel <saurel@laas.fr>

_org='jrl-umi3218'
_pkgname=jrl-cmakemodules
pkgname=$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc="CMake utility toolbox"
arch=('any')
url="https://github.com/$_org/$_pkgname"
license=('LGPL-3.0-or-later')
makedepends=('cmake')
source=("${_pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3b32110db4dae4eaa78d35b870988c1539d9c92de3e96c3894f1e85f7f94d5f4')

build() {
    cmake -B "build-$pkgver" -S "$pkgbase-$pkgver" \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build "build-$pkgver"
}

check() {
    cmake --build "build-$pkgver" -t test
}

package() {
    DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install
    install -Dm644 "$pkgbase-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
