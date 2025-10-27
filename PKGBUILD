# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>

_pkgname=dataplaneapi
pkgname=dataplaneapi-bin
pkgver=3.2.4
pkgrel=1
pkgdesc="HAProxy Data Plane API"
arch=('x86_64')
url="https://github.com/haproxytech/dataplaneapi"
license=('Apache-2.0')
depends=('haproxy')
provides=('dataplaneapi')
makedepends=('binutils')  # 'ar' is part of the binutils package
source=("${_pkgname}_${pkgver}.deb::https://github.com/haproxytech/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.deb")
sha256sums=('d9543599f3cd0de5b77d49605da894227cea5c40c48746776662fa093e2f98a9')

prepare() {
    ar x "${srcdir}/${_pkgname}_${pkgver}.deb"
    tar xf data.tar.gz
}

package() {
    mkdir -p "${pkgdir}/etc/haproxy/dataplane"

    install -Dm644 "${srcdir}/etc/dataplaneapi/dataplaneapi.yml" "${pkgdir}/etc/dataplaneapi/dataplaneapi.yml"
    install -Dm644 "${srcdir}/etc/logrotate.d/dataplaneapi" "${pkgdir}/etc/logrotate.d/dataplaneapi"
    install -Dm644 "${srcdir}/etc/default/dataplaneapi" "${pkgdir}/etc/default/dataplaneapi"
    install -Dm644 "${srcdir}/etc/systemd/system/dataplaneapi.service" "${pkgdir}/usr/lib/systemd/system/dataplaneapi.service"
    install -Dm755 "${srcdir}/usr/sbin/dataplaneapi" "${pkgdir}/usr/bin/dataplaneapi"
}
