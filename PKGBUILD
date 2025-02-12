# Maintainer: Martin Harrigan <martinharrigan at gmail dot com>
# Contributor: Dylon Edwards <dylon dot devo at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# Contributor: James Henderson
pkgname='datomic'
pkgdesc='A database of flexible, time-based facts, supporting queries and joins, with elastic scalability and ACID transactions.'
url='https://www.datomic.com/'
pkgver='1.0.7277'
pkgrel='1'
arch=('any')
license=('APACHE')
depends=('java-environment')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.zip::https://datomic-pro-downloads.s3.amazonaws.com/${pkgver}/${pkgname}-pro-${pkgver}.zip"
  "transactor.properties"
  "${pkgname}.service"
)
sha256sums=('68d86d5d156066d8817f85631b29be075899096492a82e251428f768b96dadcf'
            'e622f80994c4c21e52d59f8724d06fc6672c25479224619d3cc172df32fe31de'
            'e79d27b9127e8f2cdbbde70631d876b4142fd09e2cd44e120d03940ac22bc96d')
package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname}-pro-${pkgver}" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/transactor.properties" -t "${pkgdir}/etc/${pkgname}"
    mkdir -p "${pkgdir}/var/lib/${pkgname}" "${pkgdir}/var/log/${pkgname}"
}
