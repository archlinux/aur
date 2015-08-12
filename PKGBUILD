# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Derek Leach <mail@derek.name>

pkgname=caldavzap
pkgver=0.12.1
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
sha256sums=('6d8e451cc89d9547dd8317ae3892e1ec4031c733799ab91082a2f9d86d631214'
            'b3d469c43c48f74185d11ea896c807230247ab7dc3694fbe5d61ab16a81e11a3')

package() {
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/

  install -d ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/${pkgname}

  mv ${pkgdir}/usr/share/webapps/${pkgname}/config.js ${pkgdir}/etc/webapps/${pkgname}/config.js
  ln -s /etc/webapps/${pkgname}/config.js ${pkgdir}/usr/share/webapps/${pkgname}/config.js
}
