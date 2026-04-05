# Maintainer: Martin Harrigan <martinharrigan at gmail dot com>
# Contributor: Dylon Edwards <dylon dot devo at gmail dot com>
# Contributor: Daichi Shinozaki <dsdseg at gmail dot com>
# Contributor: James Henderson
pkgname='datomic-bin'
pkgdesc='A database of flexible, time-based facts, supporting queries and joins, with elastic scalability and ACID transactions.'
url='https://www.datomic.com/'
provides=('datomic')
conflicts=('datomic')
replaces=('datomic')
pkgver=1.0.7556
pkgrel=2
arch=('any')
license=('Apache-2.0')
depends=('java-environment')
backup=("etc/${pkgname%-bin}/transactor.properties")
install="${pkgname%-bin}.install"
source=(
  "${pkgname%-bin}-${pkgver}.zip::https://datomic-pro-downloads.s3.amazonaws.com/${pkgver}/${pkgname%-bin}-pro-${pkgver}.zip"
  "transactor.properties"
)
sha256sums=('c4849387ef016d43f951c581950ecd522898b581bcdc0e9ccc12cc4028c06c50'
            'e622f80994c4c21e52d59f8724d06fc6672c25479224619d3cc172df32fe31de')

package() {
    mkdir -p "${pkgdir}/opt"
    cp -r "${srcdir}/${pkgname%-bin}-pro-${pkgver}" "${pkgdir}/opt/${pkgname%-bin}"
    chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/transactor.properties" -t "${pkgdir}/etc/${pkgname%-bin}"
    install -dm750 -o datomic -g datomic "${pkgdir}/var/lib/${pkgname%-bin}" "${pkgdir}/var/log/${pkgname%-bin}"
}
