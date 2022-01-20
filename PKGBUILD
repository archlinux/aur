# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=seiscomp-maps
pkgver=20220120
pkgrel=1
pkgdesc="SeisComP default map files."
arch=('any')
url="https://www.seiscomp.de"
license=('AGPL3')
depends=("${pkgname%-maps}")
install=${pkgname}.install
source=("${url}/downloader/${pkgname}.tar.gz"
        "${pkgname}-tmpfiles.conf")
sha256sums=('e0488c4905260ab160b7ee2508ad5b70467665632b8f15428864cccb444e4cca'
            '312911098291e60a40d4f3fd455b9a40b2d9b3489a589fb927fb6fc0b9ac2dd2')

package() {
    install -d "${pkgdir}/opt" 
    cp -r "${pkgname%-maps}" "${pkgdir}/opt/"
    install -D -m 644 "${pkgname}-tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
    chmod -R u=rwX,g=rwX,o=rX "${pkgdir}/opt/${pkgname%-maps}"
    find "${pkgdir}/opt/${pkgname%-maps}" -type d -exec chmod g+s '{}' \;
}
# vim:set ts=4 sw=4 et:
