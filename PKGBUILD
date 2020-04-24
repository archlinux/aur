# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=backdrop
pkgver=1.15.0
pkgrel=1
pkgdesc="The free and Open Source CMS that helps you build websites for businesses and non-profits."
arch=("any")
url="https://backdropcms.org/"
license=('GPL-2.0')
depends=('php>=5.3.2' 'mariadb>=5.0.15' 'php-gd')
optdepends=('apache: A high performance Unix-based HTTP server (recommended)' 
			'nginx: Lightweight HTTP server and IMAP/POP3 proxy server')
install=backdrop.install
source=("https://github.com/backdrop/backdrop/archive/${pkgver}.tar.gz")
md5sums=('b87bf0d9ac578bb5461d25e4066064f9'
		 '7fbee32b61dc7db14c3b63e2d2ad4ac3')

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
