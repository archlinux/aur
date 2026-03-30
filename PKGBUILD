# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpeghdec
pkgver=3.0.3
pkgrel=1
pkgdesc='Fraunhofer MPEG-H audio decoder'
arch=('x86_64')
url='https://mpegh.com/'
license=('LicenseRef-Custom')
depends=(
    'glibc'
    'libgcc'
    'libstdc++')
makedepends=(
    'cmake'
    'git')
source=("https://github.com/Fraunhofer-IIS/mpeghdec/archive/r${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0198ebc824332926c0c39abf216df65606da896a4204c93be77b1581b5bf0b73')

build() {
    cmake -B build -S "mpeghdec-r${pkgver}" \
        -G 'Unix Makefiles' \
        -DBUILD_SHARED_LIBS:BOOL='ON' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCMAKE_SKIP_RPATH:BOOL='YES' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m755 build/bin/* -t "${pkgdir}/usr/bin"
    install -D -m644 "mpeghdec-r${pkgver}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/pkgconfig" "${pkgdir}/usr/lib"
}
