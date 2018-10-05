# Maintainer : George Eleftheriou <eleftg>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=libaec-static
_pkgname=libaec
pkgver=1.0.2
pkgrel=1
pkgdesc="Adaptive Entropy Coding library"
arch=('x86_64')
url='https://gitlab.dkrz.de/k202009/libaec/'
license=('custom')
depends=('glibc')
makedepends=('cmake')
options=('staticlibs')
_md5=b30adc1abf805d7454896ab83c900eb8
source=("${url}/uploads/${_md5}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('024722866eb859bf926d6f9cb20edd3f26e80a1bdbea1889e9235d5eca3106d0')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../${_pkgname}-${pkgver} \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}"/usr/{include,share/man,bin}
    install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/Copyright.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
