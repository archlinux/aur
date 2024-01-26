# Maintainer: Dylon Edwards <dylon dot devo at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# Contributor: James Henderson
pkgname=datomic
pkgver=1.0.7075
pkgrel=1
pkgdesc="A database of flexible,time-based facts,supporting queries and joins,with elastic scalability,and ACID transactions"
arch=('any')
url=https://www.datomic.com/
license=('APACHE')
depends=('java-environment' 'clojure')
options=(!strip)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.zip::https://datomic-pro-downloads.s3.amazonaws.com/${pkgver}/${pkgname}-pro-${pkgver}.zip"
    "transactor.properties"
    "${pkgname}.service"
)
md5sums=('f79a099f1c8fc0b43c96835afc7db2f2'
         '8424bc5c8bff46a5d8251d046ba466df'
         '139868f11fd75560a4d15c4d74939e48')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname}-pro-${pkgver}" "${pkgdir}/opt/${pkgname}"
    install -D "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -D "${srcdir}/transactor.properties" -t "${pkgdir}/etc/datomic"
    mkdir -p "${pkgdir}/var/lib/datomic" "${pkgdir}/var/log/datomic"
}

# vim:set ts=2 sw=2 et:
