# Maintainer: David Roheim <david.roheim@gmail.com>

pkgname=('magento')
pkgver=1.9.1.1
pkgrel=1
pkgdesc="Magento Community Edition ${pkgver} - PHP based e-commerce"
license=('OSL3')
arch=('any')
url='http://www.magentocommerce.com/'

source=("http://www.magentocommerce.com/downloads/assets/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('011f8a9ae9a370e0d758e0395cfcd03e91be5b48fbfaad90d745ccf76a9d0083')

depends=('php>=5.3.24' 'php-mcrypt' 'php-gd' 'mariadb-clients' 'curl' 'gd')
optdepends=('redis' 'php-redis')
options=(!strip)
install=${pkgname}.install

build_magento() {
  true
}

package_magento() {
  install -d -m755 ${pkgdir}/usr/share/webapps/${pkgname}
  install -d -m755 ${pkgdir}/etc/webapps/${pkgname}

  install -D -m644 ${srcdir}/${pkgname}/LICENSE.txt     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"     || return 1
  install -D -m644 ${srcdir}/${pkgname}/LICENSE.html    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"    || return 1
  install -D -m644 ${srcdir}/${pkgname}/LICENSE_AFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_AFL.txt" || return 1

  mv ${srcdir}/${pkgname}/.htaccess ${pkgdir}/etc/webapps/${pkgname}/htaccess
  mv $srcdir/$pkgname/app/etc $pkgdir/etc/webapps/${pkgname}
  mv $srcdir/$pkgname $pkgdir/usr/share/webapps/

  ln -s /etc/webapps/${pkgname}/etc ${pkgdir}/usr/share/webapps/${pkgname}/app/etc
  ln -s /etc/webapps/${pkgname}/htaccess ${pkgdir}/usr/share/webapps/${pkgname}/.htaccess
}

# vim:set ts=2 sw=2 sts=2 et :
