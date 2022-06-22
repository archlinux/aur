# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp-docs
pkgver=5.0.0
pkgrel=1
pkgdesc="SeisComP documentations."
arch=('any')
url="https://www.seiscomp.de"
license=('AGPL3')
depends=("${pkgname%-docs}")
install=${pkgname}.install
source=("${url}/downloader/${pkgname%-docs}-${pkgver}-doc.tar.gz"
        "${pkgname}-tmpfiles.conf")
sha256sums=('bbbb71a8b37d5537e1c32c81437428be2e4d1db6564301c35c70f5d8795c72be'
            'f97f1a840f144d1dfce190c39e1ef8c3a4b14bd2d959e0a7259b3fa7cf21d840')

package() {
    install -d "${pkgdir}/opt" 
    cp -r "${pkgname%-docs}" "${pkgdir}/opt/"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname%-docs}"
    find "${pkgdir}/opt/${pkgname%-docs}" -type d -exec chmod g+s '{}' \;
}
# vim:set ts=4 sw=4 et:
