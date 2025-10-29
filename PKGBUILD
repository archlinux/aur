# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mpeghdec
pkgver=3.0.2
pkgrel=1
pkgdesc='Fraunhofer MPEG-H audio decoder'
arch=('x86_64')
url='https://mpegh.com/'
license=('LicenseRef-Custom')
depends=(
    'gcc-libs'
    'glibc')
makedepends=(
    'cmake'
    'git')
source=("https://github.com/Fraunhofer-IIS/mpeghdec/archive/r${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a2108be60a98ec2736b42edb2f5727f3cc22d49196f3802a981f242dd38f136c')

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
