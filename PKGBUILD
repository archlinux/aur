# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zectl
pkgver=0.1.4
pkgrel=1
pkgdesc="ZFS Boot Environment manager."
url="http://github.com/johnramsden/${pkgname}"
arch=('any')
license=('MIT')
depends=('zfs')
makedepends=('make' 'cmake')
conflicts=("${pkgname}-git")
provides=("zectl")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/johnramsden/${pkgname}/archive/v${pkgver}.tar.gz"
)

sha256sums=('e162dcdf62ebb90b54b2a8b876018a463a33ac25263c585f5da3661314dabbca')

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
