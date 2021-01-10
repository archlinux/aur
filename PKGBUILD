# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=emoncms
pkgver=10.2.7
pkgrel=1
pkgdesc="an open-source web application for processing, logging and visualising energy, temperature and other environmental data"
url="https://emoncms.org"
arch=('any')
license=('GPL3')
depends=('php' 'mariadb' 'php-apache' 'php-mcrypt')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emoncms/emoncms/archive/${pkgver}.tar.gz" "apache.example.conf")
sha256sums=('809b5182c8827cb083eb67633d62b816e9ed74e682be04d68aaaa6eaeb65784f'
            '76a61bd7b3741811d19b2ab390d6809049a3ad3f737bd61b93929b871c3e63ca')

options=(!strip emptydirs)

package() {
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/$pkgname-$pkgver/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a ${srcdir}/$pkgname-$pkgver "${pkgdir}/usr/share/webapps/$pkgname"
  
  install -m644 -D ${srcdir}/apache.example.conf -t ${pkgdir}/etc/webapps/$pkgname
}

# vim:set ts=2 sw=2 et:
