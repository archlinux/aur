# Maintainer: Dringsim <dringsim@qq.com>
_pkgname=libLASi
pkgname=liblasi
pkgver=1.1.3
pkgrel=1
pkgdesc="A library that provides a C++ stream output interface (with operator <<) for creating Postscript documents that can contain characters from any of the scripts and symbol blocks supported in Unicode and by the Pango layout engine"
arch=("x86_64")
url="https://unifont.org/lasi"
license=("LGPL-2.0-or-later")
depends=(
    "freetype2"
    "pango"
)
makedepends=(
    "cmake"
)
source=("http://downloads.sourceforge.net/sourceforge/lasi/${_pkgname}-${pkgver}.tar.gz")
sha512sums=("SKIP")

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    if [ -d build ]; then
        rm -r build
    fi
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED=ON -DCMAKE_CXX_STANDARD=14 ..

    make all
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"
    ctest
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
}
