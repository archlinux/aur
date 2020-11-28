# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=prestashop
pkgver=1.7.6.8
pkgrel=1
pkgdesc="A fully scalable open source ecommerce solution"
arch=('any')
url="https://www.prestashop.com"
license=('custom:OSL3' 'custom:AFL3')
depends=('php-gd' 'php-fpm' 'php-intl' 'mariadb')
makedepends=('unzip')
options=('!strip')
optdepends=('apache: A high performance Unix-based HTTP server' 
            'nginx: Lightweight HTTP server and IMAP/POP3 proxy server')
install=prestashop.install
source=("${pkgname}-${pkgver}.zip::https://github.com/PrestaShop/PrestaShop/releases/download/${pkgver}/prestashop_${pkgver}.zip"
    'prestashop.conf')
sha256sums=('ad1dbf9381f9a429d31409f584953419003259db9995ed38f1310d9095cde34e'
            'f074c7a6cad0827dc3ce4e04f94653f6c4bdd4697940538cdf017204f73d4735')

package() {
  cd "${srcdir}"
  install -dm0755 ${pkgdir}/usr/share/webapps/${pkgname}
  unzip ${pkgname}.zip -d ${pkgdir}/usr/share/webapps/${pkgname}
  chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}
  install -Dm644 ../prestashop.conf ${pkgdir}/etc/httpd/conf/extra/prestashop.conf
  install -Dm644 "${pkgdir}/usr/share/webapps/prestashop/LICENSES" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
