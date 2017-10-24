# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.7.0
pkgrel=2
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
sha512sums=('8be61bd8aa94bafe7af081de7d8411d89f69baa7cdda06ae8bdb2df5f44735d2d91cd44a7510dc8d8abb08fb6c182553018eeb88a44655681f3e5aed2f116873')

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
