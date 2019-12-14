# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=lodepng
pkgver=20191109
pkgrel=1
pkgdesc="PNG encoder and decoder in C and C++, without dependecies."
url="https://lodev.org/lodepng"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
source=('git+https://github.com/lvandeve/lodepng.git'
        'CMakeLists.txt')
sha256sums=('SKIP'
            '70ba9558661bc182cf98c07c990fd4c4629612e5c1021b87e38e897c430a72ac')

pkgver() {
    cd lodepng
    git grep 'LODEPNG_VERSION_STRING =' | cut -d\" -f2
}

prepare() {
    cp ${srcdir}/CMakeLists.txt ${srcdir}/lodepng/
    rm -rf ${srcdir}/lodepng/build && mkdir -p ${srcdir}/lodepng/build
}

build() {
    cd ${srcdir}/lodepng/build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd ${srcdir}/lodepng
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd build
    make DESTDIR="${pkgdir}/" install
}
