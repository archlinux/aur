# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=prestashop
pkgver=1.7.6.4
pkgrel=1
pkgdesc="PrestaShop offers a fully scalable open source ecommerce solution"
arch=("any")
url="https://www.prestashop.com/"
license=('OSL-3.0' 'AFL-3.0')
depends=('php' 'php-gd' 'php-fpm' 'php-intl' 'mariadb')
makedepends=('unzip')
optdepends=('apache: A high performance Unix-based HTTP server' 
			'nginx: Lightweight HTTP server and IMAP/POP3 proxy server')
install=post_install
source=("https://github.com/PrestaShop/PrestaShop/releases/download/${pkgver}/prestashop_${pkgver}.zip"
		'post_install'
		'prestashop.conf')
md5sums=('6dc99fb5a6c3a01a94bb8b2de07411d6'
		 'a49ba9b0df2b199ef6e588727456c57f'
		 '9fa6528dd4f7a2080bf5f35e6cb1c994')

package() {
    cd "${srcdir}"
    install -dm0755 ${pkgdir}/usr/share/webapps/${pkgname}
    unzip prestashop.zip -d ${pkgdir}/usr/share/webapps/${pkgname}
    chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}
    install -Dm644 prestashop.conf ${pkgdir}/etc/httpd/conf/extra/prestashop.conf
}