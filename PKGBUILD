# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=nextcloud
pkgver=9.0.2
pkgrel=1
pkgdesc="nextcloud: A safe home for all your data. Secure, under your control and developed in an open, transparent and trustworthy way"
url="https://nextcloud.com"
arch=('any')
license=('GPL')
depends=('php' 'php-gd')
optdepends=('php-apache: to use the Apache web server'
      'php-sqlite: to use the SQLite database backend'
      'php-pgsql: to use the PostgreSQL database backend'
      'php-ldap: LDAP authentication'
      'php-intl'
      'php-apcu'
      'mariadb: to use the MySQL database backend'
      'smbclient: to mount SAMBA shares'
      'php-mcrypt'
      'imagemagick: file preview'
      'ffmpeg: file preview'
      'libreoffice: file preview')
options=('!strip')
install=${pkgname}.install
#validpgpkeys=('E3036906AD9F30807351FAC32D5D5E97F6978A26')
#source=("https://download.owncloud.org/community/owncloud-${pkgver}.tar.bz2"{,.asc}
source=("apache.example.conf"
#  "https://github.com/nextcloud/server/archive/v${pkgver}.tar.gz"
  "set-nc-perms.sh")
md5sums=('bc2b02b0562b7a58e660e33acd4202bc'
         '106536581b9d2a69b363f375c2dbd349')

options=(!strip emptydirs)

#prepare() {
#  cd nextcloud-${pkgver}
#}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "${srcdir}/nextcloud/COPYING-*" "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a nextcloud "${pkgdir}/usr/share/webapps/."
 
  install -D -m755 "${srcdir}/set-nc-perms.sh" "${pkgdir}/usr/bin/set-nc-perms"
  install -m644 -D "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/nextcloud"
  ln -s /usr/share/webapps/nextcloud/ncc "${pkgdir}/usr/bin/ncc"
}

# vim:set ts=2 sw=2 et:
