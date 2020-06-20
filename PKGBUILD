# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=prestashop
pkgver=1.7.7.0.beta.1
_pkgver=1.7.7.0-beta.1
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
source=("${pkgname}-${pkgver}.zip::https://github.com/PrestaShop/PrestaShop/releases/download/${_pkgver}/prestashop_${_pkgver}.zip"
    'prestashop.conf')
sha256sums=('e47702ba38c295935262f7c7b2b2282dbe081b8535750013745adca98cd4047c'
            'SKIP')

package() {
  cd "${srcdir}"
  install -dm0755 ${pkgdir}/usr/share/webapps/${pkgname}
  unzip ${pkgname}.zip -d ${pkgdir}/usr/share/webapps/${pkgname}
  chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}
  install -Dm644 ../prestashop.conf ${pkgdir}/etc/httpd/conf/extra/prestashop.conf
  install -Dm644 "${pkgdir}/usr/share/webapps/prestashop/LICENSES" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}