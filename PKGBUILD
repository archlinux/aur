# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.10.0
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
            'php-pgsql: PostgreSQL database'
            'uwsgi: Application server to run MantisBT')
backup=('etc/webapps/mantisbt/config_inc.php')
source=("https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('09073bb30b378143704b444cbe40f7162d257baadf5bac3343d6034b6c22455b3f723f18bee3e5a5655644d549586ef55f3eec56569f56d5b05cc2b6ce2e1d87')
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
