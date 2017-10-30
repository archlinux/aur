# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.8.0
pkgrel=1
pkgdesc='Web-based issue tracking system'
arch=('any')
url='https://www.mantisbt.org/'
license=('GPL')
depends=('php')
optdepends=('apache: Web server to run MantisBT'
            'curl: Twitter integration'
            'gd: Graphs support'
            'lighttpd: Web server to run MantisBT'
            'mariadb: SQL database'
            'nginx: Web server to run MantisBT'
            'php-pgsql: PostgreSQL database')
backup=('etc/webapps/mantisbt/config_inc.php')
source=("https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a01b1f5c18a2196c914078ee6948369836a3d3386af5b4c281266244f5efaae382331fb9b68bf640261c23f88ca3217037c32d13e8eaa1ee5c1553fd53a589bf')
install="${pkgname}.install"

prepare() {
  cd "${pkgname}-${pkgver}"
  find . -type f -exec chmod 0644 {} \;
  find . -type d -exec chmod 0755 {} \;
}

package() {
  install -dm 755 "${pkgdir}"/{etc/webapps/mantisbt,usr/share/webapps}
  cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"

  #configuration
  cp "${pkgdir}"/usr/share/webapps/mantisbt/config/config_inc.php.sample "${pkgdir}/etc/webapps/mantisbt/config_inc.php"
  ln -s /etc/webapps/mantisbt/config_inc.php "${pkgdir}/usr/share/webapps/mantisbt/config/config_inc.php"
}

# vim: ts=2 sw=2 et:
