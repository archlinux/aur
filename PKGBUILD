# Maintainer: Roice Young <insanelydefault@proton.me>

pkgname=libmysofa-3dj
pkgver=1.3.2.2
pkgrel=1
pkgdesc='C library to read HRTFs if they are stored in the AES69-2015 SOFA format(3DJ fork with safe sofa size limit increase)'
arch=('x86_64')
url='https://github.com/hoene/libmysofa/'
license=('BSD')
depends=('zlib')
makedepends=('cmake' 'cunit')
checkdepends=('nodejs')
provides=('libmysofa.so' 'libmysofa' )
conflicts=('libmysofa' 'libmysofa-git')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/ThreeDeeJay/libmysofa/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('3731b49f10e317ae53c12d416150dc4578aef5dbd29ae08b4b2ceb1c006abf5d0db8b43fe8e6d6eb401a25193596451c60b7900fbc7e4e6608f6a79ebe062556')

build() {
    cmake \
        -G 'Unix Makefiles' \
        -B "libmysofa-${pkgver}/build" \
        -S "libmysofa-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCODE_COVERAGE:BOOL='OFF' \
        -Wno-dev
    cmake --build "libmysofa-${pkgver}/build"
}

check() {
    ctest --test-dir "libmysofa-${pkgver}/build" --output-on-failure --stop-on-failure
}

package() {
    DESTDIR="${pkgdir}" cmake --install "libmysofa-${pkgver}/build"
    install -D -m644 "libmysofa-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/libmysofa"
}
