# Maintainer: Martin Harrigan <martin dot harrigan at gmail dot com>
# Maintainer: Dylon Edwards <dylon dot devo at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# Contributor: James Henderson

pkgname=datomic
pkgver=1.0.7187
pkgrel=1
pkgdesc="A database of flexible,time-based facts,supporting queries and joins,with elastic scalability,and ACID transactions"
arch=('any')
url=https://www.datomic.com/
license=('APACHE')
depends=('java-environment')
options=(!strip)
install="${pkgname}.install"
source=(
    "${pkgname}-${pkgver}.zip::https://datomic-pro-downloads.s3.amazonaws.com/${pkgver}/${pkgname}-pro-${pkgver}.zip"
    "transactor.properties"
    "${pkgname}.service"
)
md5sums=('1107dc89c3bc0896a02458d34a875143'
         'a34e9e7a0e4b0fade06ba8200c4bd530'
         '45c1fbdb988afd06295b6c90d7bcd819')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname}-pro-${pkgver}" "${pkgdir}/opt/${pkgname}"
    install -D "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -D "${srcdir}/transactor.properties" -t "${pkgdir}/etc/datomic"
    mkdir -p "${pkgdir}/var/lib/datomic" "${pkgdir}/var/log/datomic"
}
