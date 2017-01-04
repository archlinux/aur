# Maintainer : Immae <ismael.bouya@normalesup.org>
# Contributor: Stefan Tatschner <stefan@sevenbyte.org>
# Contributor: Derek Leach <mail@derek.name>

pkgname=carddavmate
pkgver=0.13.1
pkgrel=2
pkgdesc="A CardDav web client"
arch=('any')
url="http://www.inf-it.com/open-source/clients/carddavmate/"
license=('AGPL3')
depends=('ed')
optdepends=('apache: Webserver to run CardDavMATE')
backup=('etc/webapps/carddavmate/config.js'
        'etc/webapps/carddavmate/apache.example.conf')
install=${pkgname}.install
source=("http://www.inf-it.com/CardDavMATE_${pkgver}.zip"
        "https://www.inf-it.com/fixes/photo_attr_fix.diff"
        'apache.example.conf')
md5sums=('db12580e5691b806d7e9c2e13e93f8fc'
         'c51941dd250bc0aa59446d2ec4a893b0'
         '16fedd024cede2aa359076d7a988072d')

package() {
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/${pkgname} ${pkgdir}/usr/share/webapps/

  install -d ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf ${pkgdir}/etc/webapps/${pkgname}

  cd ${pkgdir}/usr/share/webapps/${pkgname}
  patch data_process.js < ${srcdir}/photo_attr_fix.diff

  mv ${pkgdir}/usr/share/webapps/${pkgname}/config.js ${pkgdir}/etc/webapps/${pkgname}/config.js
  ln -s /etc/webapps/${pkgname}/config.js ${pkgdir}/usr/share/webapps/${pkgname}/config.js
}
