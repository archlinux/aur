# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Derek Leach <mail@derek.name>

pkgname=caldavzap
pkgver=0.12.0
pkgrel=1
pkgdesc="A CalDav web client"
arch=('any')
url="http://www.inf-it.com/open-source/clients/caldavzap"
license=('AGPL3')
depends=('ed')
optdepends=('apache: Webserver to run CalDavZAP')
backup=('etc/webapps/caldavzap/config.js'
        'etc/webapps/caldavzap/apache.example.conf')
install=${pkgname}.install
source=("http://www.inf-it.com/CalDavZAP_${pkgver}.zip"
        'apache.example.conf')
sha256sums=('8ffaab17b46aa58e225add95c5ea4496d9124ee019b13f4918a7216e44d87655'
            'b3d469c43c48f74185d11ea896c807230247ab7dc3694fbe5d61ab16a81e11a3')

package() {
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/

  install -d ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/${pkgname}

  mv ${pkgdir}/usr/share/webapps/${pkgname}/config.js ${pkgdir}/etc/webapps/${pkgname}/config.js
  ln -s /etc/webapps/${pkgname}/config.js ${pkgdir}/usr/share/webapps/${pkgname}/config.js
}
