# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=oqsprovider
_pkgname=oqs-provider
pkgver=0.5.0
pkgrel=1
pkgdesc="OpenSSL 3 provider containing post-quantum algorithms"
arch=('x86_64')
url="https://openquantumsafe.org/applications/tls.html#oqs-openssl-provider"
license=('MIT')
depends=(
    'liboqs'
    'openssl'
)
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/open-quantum-safe/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('93a3ae7d2043728f2eca90b3d111b94c75c46f27f3323da1f79ca6dc32357f27099f7f76c7ba6cf6357b0b1636789379ffc7363b369febdca7af69fb01a4abd5')

build() {
    cmake -B build -S "${_pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so.1 "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so.1
    install -D -m0755 "${srcdir}"/build/lib/oqsprovider.so.0.5.0 "${pkgdir}"/usr/lib/ossl-modules/oqsprovider.so.0.5.0
    install -D -m0644 "${srcdir}"/${_pkgname}-${pkgver}/LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
