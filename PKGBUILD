# Maintainer: Jocelyn Meyron <jmeyron@gmail.com>

pkgname=dgtal
pkgver=1.0
pkgrel=1
pkgdesc="Digital Geometry Tools and Algorithms Library"
arch=("x86_64")
url="https://dgtal.org/"
license=("GPL")
makedepends=("cmake>=3.1" "boost>=1.46" "gcc>=4.8.1")
depends=("zlib" "gcc-libs")
source=("https://github.com/DGtal-team/DGtal/archive/$pkgver.zip")
sha256sums=('3c6cc31830f0c8b6e178d9cfa1855ad5dfef26ca146ce7301c090f220f9100a2')

build() {
    cd "DGtal-$pkgver"
    rm -rf build && mkdir build && cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_EXAMPLES=OFF
    make
}

package() {
    cd "DGtal-$pkgver/build"
    make DESTDIR="$pkgdir/" install

    # Remove empty directories
    rm -rf $pkgdir/usr/include/DGtal/geometry/doc/experiments
    rm -rf $pkgdir/usr/include/DGtal/geometry/doc/tutorials/images
    rm -rf $pkgdir/usr/include/DGtal/io/doc/
    rm -rf $pkgdir/usr/include/DGtal/base/doc
    rm -rf $pkgdir/usr/include/DGtal/images/doc/
    rm -rf $pkgdir/usr/include/DGtal/shapes/doc/
    rm -rf $pkgdir/usr/include/DGtal/graph/doc/
    rm -rf $pkgdir/usr/include/DGtal/geometry/doc/
    rm -rf $pkgdir/usr/include/DGtal/kernel/doc/
    rm -rf $pkgdir/usr/include/DGtal/arithmetic/doc/
    rm -rf $pkgdir/usr/include/DGtal/topology/doc/
    rm -rf $pkgdir/usr/include/DGtal/dec/doc/
    rm -rf $pkgdir/usr/include/DGtal/math/doc/
    rm -rf $pkgdir/usr/include/DGtal/doc
    rm -rf $pkgdir/usr/include/BoostAddons
    rm -rf $pkgdir/usr/share/
}

