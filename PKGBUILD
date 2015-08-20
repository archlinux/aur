# Maintainer: Joseph R. Prostko <joe dot prostko at gmail dot com>

pkgname=concrete5
_pkgname=concrete
pkgver=5.7.5.1
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
source=(http://www.concrete5.org/releases/$_pkgname$pkgver.zip)
sha256sums=('960a0636899ad1498476270d8469f436a68964ab2fa9c2269bb29002877997c8')

package() {
  _instdir=$pkgdir/usr/share/webapps/$pkgname
  install -d ${_instdir}
  cp -a ${_pkgname}$pkgver/* ${_instdir}

  # Make certain directories writable by the web server
  chown -R http:http ${_instdir}/packages
  chown -R http:http ${_instdir}/application/config
  chown -R http:http ${_instdir}/application/files
}
