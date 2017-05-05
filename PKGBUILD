# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alexander 'gridcol' Griesbaum <agrsbm@gmail.com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov@gmail>
# Contributor: Angel 'angvp' Velasquez <angvp@archlinux.com.ve>

pkgname=mantisbt
pkgver=2.4.0
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
install='mantisbt.install'
source=("https://downloads.sourceforge.net/project/${pkgname}/mantis-stable/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0888a03d4ab7881d748d1fb8a1bcbf2c2f018f0e21461c2333ed7c5cd9d54b6b')

package() {
  install -dm 755 "${pkgdir}"/{etc/webapps/mantisbt,usr/share/webapps}
  cp -dr --no-preserve='ownership' mantisbt-${pkgver} "${pkgdir}"/usr/share/webapps/mantisbt

  cp "${pkgdir}"/usr/share/webapps/mantisbt/config/config_inc.php.sample "${pkgdir}"/etc/webapps/mantisbt/config_inc.php
  ln -s /etc/webapps/mantisbt/config_inc.php "${pkgdir}"/usr/share/webapps/mantisbt/config/config_inc.php

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
}

# vim: ts=2 sw=2 et:
