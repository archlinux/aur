# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=concrete5
pkgver=8.0.0
pkgrel=1
pkgdesc="A PHP-based open source content management system"
arch=('any')
url="http://www.concrete5.org/"
license=('MIT')
depends=('php' 'mysql')
optdepends=('apache: Web server to run concrete5'
            'nginx: Web server to run concrete5'
            'cherokee: Web server to run concrete5'
            'lighttpd: Web server to run concrete5')
install="$pkgname.install"
options=('!strip')
source=(http://www.concrete5.org/releases/$pkgname-$pkgver.zip)
sha256sums=('8840d1588fdbdc9ef572ab9def8cfe1e4e59f7bb15a26ab95f1217d0c0d5f29b')

package() {
  _instdir=$pkgdir/usr/share/webapps/$pkgname
  install -d ${_instdir}
  cp -a ${pkgname}-$pkgver/* ${_instdir}

  # Make certain directories writable by the web server
  chown -R http:http ${_instdir}/packages
  chown -R http:http ${_instdir}/application/config
  chown -R http:http ${_instdir}/application/files
}
