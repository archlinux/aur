# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpeghdec
pkgver=3.0.1
pkgrel=1
pkgdesc='Fraunhofer MPEG-H audio decoder'
arch=('x86_64')
url='https://mpegh.com/'
license=('LicenseRef-Custom')
depends=(
    'glibc')
makedepends=(
    'cmake')
source=("https://github.com/Fraunhofer-IIS/mpeghdec/archive/r${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f5fdacc185f62923738b0760745ee8545b6c81fcbdf7e90b7b922b5070cb83d0')

build() {
    cmake -B build -S "mpeghdec-r${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Dmpeghdec_BUILD_BINARIES:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 "mpeghdec-r${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/pkgconfig" "${pkgdir}/usr/lib"
}
