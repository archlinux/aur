# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zectl
pkgver=0.1.5
pkgrel=1
pkgdesc="ZFS Boot Environment manager."
url="http://github.com/johnramsden/${pkgname}"
arch=('any')
license=('MIT')
depends=('zfs')
makedepends=('make' 'cmake' 'scdoc')
conflicts=("${pkgname}-git")
provides=("zectl")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/johnramsden/${pkgname}/archive/v${pkgver}.tar.gz"
)

sha256sums=('11e91b357baf3a62556a0ff264f25b2a6d5b798db72cef44bcf1a3063949cde9')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    CFLAGS+=" -fmacro-prefix-map=$PWD/=" cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DPLUGINS_DIRECTORY=/usr/share/zectl/libze_plugin .
    make VERBOSE=1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/docs/zectl.8" "${pkgdir}/usr/share/man/man8/zectl.8"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
