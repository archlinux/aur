pkgname=ml-kem
pkgver=1.0.2
pkgrel=2
pkgdesc="Pure C implementation of ML-KEM (FIPS 203)"
arch=('x86_64')
url="https://github.com/kstzv/ml-kem"
license=('MIT' 'GPL2')
options=(!lto !strip)
depends=('glibc')
makedepends=('make' 'gcc')

source=("https://github.com/kstzv/ml-kem/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/ml-kem-${pkgver}/userspace"
    make
}

package() {
    cd "${srcdir}/ml-kem-${pkgver}/userspace"

    install -Dm644 libmlkem.a \
        "${pkgdir}/usr/lib/libmlkem.a"

    install -Dm644 ml_kem.h \
        "${pkgdir}/usr/include/ml_kem.h"

    install -Dm644 ml_kem_core_header.h \
        "${pkgdir}/usr/include/ml_kem_core_header.h"

    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
