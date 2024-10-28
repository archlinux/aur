# Maintainer: Martin Harrigan <martinharrigan at gmail dot com>
# Contributor: Dylon Edwards <dylon dot devo at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# Contributor: James Henderson
pkgname='datomic'
pkgdesc='A database of flexible, time-based facts, supporting queries and joins, with elastic scalability and ACID transactions.'
url='https://www.datomic.com/'
pkgver='1.0.7260'
pkgrel='1'
arch=('any')
license=('APACHE')
depends=('java-environment')
options=(!strip)
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.zip::https://datomic-pro-downloads.s3.amazonaws.com/${pkgver}/${pkgname}-pro-${pkgver}.zip"
  "transactor.properties"
  "${pkgname}.service"
)
sha256sums=('e2f6f891fe3e335927264e709a33365acd2e400fe776f7de5711e531e2ea4e3c'
            'e622f80994c4c21e52d59f8724d06fc6672c25479224619d3cc172df32fe31de'
            'b173efbd9d8ba8059fd8fbca2fdba3dc936f9f9ada51f6cf017424d2f590ebdc')
package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname}-pro-${pkgver}" "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/transactor.properties" -t "${pkgdir}/etc/datomic"
    mkdir -p "${pkgdir}/var/lib/datomic" "${pkgdir}/var/log/datomic"
}
