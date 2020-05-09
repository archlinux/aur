# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=backdrop
pkgver=1.15.1
pkgrel=1
pkgdesc="The free and Open Source CMS that helps you build websites for businesses and non-profits."
arch=("any")
url="https://backdropcms.org/"
license=('GPL2')
depends=('php>=5.3.2' 'mariadb>=5.0.15' 'php-gd')
optdepends=('apache: A high performance Unix-based HTTP server (recommended)' 
			'nginx: Lightweight HTTP server and IMAP/POP3 proxy server')
install=backdrop.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/backdrop/backdrop/archive/${pkgver}.tar.gz")
sha256sums=('7d5496a3927eee26a8879f40cc53204d2a32ab3e9a5d901941902c7c04918e62')

package() {
  cd "${pkgdir}"
  install -dm0755 usr/share/webapps/${pkgname}
  cd ${srcdir}/${pkgname}-${pkgver}
  tar cvf - . | (cd ${pkgdir}/usr/share/webapps/backdrop; tar xvf -)
  cd ${pkgdir}/usr/share/webapps/${pkgname}
  find . -type f -exec chmod 664 '{}' \;
  find . -type d -exec chmod 775 '{}' \;
  chown -R http: files settings.php
  chmod -R 770 files settings.php
}
