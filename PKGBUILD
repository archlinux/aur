# Maintainer: SaultDon <sault.don gmail>
pkgname=pdal
_pkgname=PDAL
pkgver=1.4.0
pkgrel=1
pkgdesc="A C++ BSD library for translating and manipulating point cloud data."
arch=('any')
url="http://www.pdal.io"
license=('BSD')
depends=('gdal' 'libgeotiff')
makedepends=('cmake')
provides=('pdal')
source=("http://download.osgeo.org/pdal/$_pkgname-$pkgver-src.tar.gz")
md5sums=('c215815887158083b89e795a8c95a401')

prepare() {
    cd "$_pkgname-$pkgver-src"

    [[ -d build ]] || mkdir build
}

build() {
    cd "$_pkgname-$pkgver-src/build"

    cmake -G "Unix Makefiles" ../ \
    -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd "$_pkgname-$pkgver-src/build"

    make DESTDIR="$pkgdir/" install

    cd "$srcdir/$_pkgname-$pkgver-src"
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}