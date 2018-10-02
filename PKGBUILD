# Maintainer: Ding Xiao <tinocodfcdsa10@mails.tsinghua.edu.cn>

_basename=libdivsufsort
pkgname=libdivsufsort64
pkgver=2.0.1
pkgrel=2
pkgdesc="A lightweight suffix-sorting library"
arch=("x86_64")
url="https://github.com/y-256/libdivsufsort"
license=("BSD")
makedepends=("cmake")
provides=("libdivsufsort64")
conflicts=("libdivsufsort64")
source=("https://github.com/y-256/libdivsufsort/archive/${pkgver}.tar.gz")

build() {
    cd "${_basename}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr" -DBUILD_DIVSUFSORT64=ON
    make
}

package() {
    cd "${_basename}-${pkgver}"
    make DESTDIR="${pkgdir}" install 
    install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
    install -D -m0644 README  "${pkgdir}/usr/share/doc/${pkgname}/README"
    rm -f "${pkgdir}"/usr/lib/*.la
    rm -f "${pkgdir}"/usr/include/libdivsufsort.h
    rm -f "${pkgdir}"/usr/lib/libdivsufsort.so
    rm -f "${pkgdir}"/usr/lib/libdivsufsort.so.3
    rm -f "${pkgdir}"/usr/lib/libdivsufsort.so.3.0.0
    rm -f "${pkgdir}"/usr/lib/pkgconfig/libdivsufsort.pc
}

sha1sums=("4d0d0c153ec74ce3584d393440a3d344342581ad")
