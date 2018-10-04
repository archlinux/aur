# Maintainer: Eric Biggers <ebiggers3@gmail.com>

pkgname=libdivsufsort
pkgver=2.0.1
pkgrel=3
pkgdesc="A lightweight suffix-sorting library"
arch=("i686" "x86_64")
url="https://github.com/y-256/libdivsufsort"
license=("MIT")
makedepends=("cmake")
source=("https://github.com/y-256/libdivsufsort/archive/${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr" \
          -DBUILD_DIVSUFSORT64=1
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install 
    install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -D -m0644 README  "${pkgdir}/usr/share/doc/${pkgname}/README"
    rm -f "${pkgdir}"/usr/lib/*.la
}

sha256sums=("9164cb6044dcb6e430555721e3318d5a8f38871c2da9fd9256665746a69351e0")
