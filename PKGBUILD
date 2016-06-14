# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=nextcloud
pkgver=9.0.50
pkgrel=1
pkgdesc="nextcloud: A safe home for all your data. Secure, under your control and developed in an open, transparent and trustworthy way"
url="https://nextcloud.com"
arch=('any')
license=('AGPL')
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
#validpgpkeys=('2880 6A87 8AE4 23A2 8372  792E D758 99B9 A724 937A')
source=("apache.example.conf"
  "https://download.nextcloud.com/server/releases/nextcloud-${pkgver}.tar.bz2"
#  "https://download.nextcloud.com/server/releases/nextcloud-${pkgver}.tar.bz2"{,.asc}
  "set-nc-perms.sh")
md5sums=('bc2b02b0562b7a58e660e33acd4202bc'
         '83cdce392a8520869933ccf75addb836'
         '0c996a76cf39b2bccde8d74ac062895e')

options=(!strip emptydirs)

#prepare() {
#  cd nextcloud-${pkgver}
#}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "${srcdir}/nextcloud/COPYING-AGPL" "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a nextcloud "${pkgdir}/usr/share/webapps/."
 
  install -D -m755 "${srcdir}/set-nc-perms.sh" "${pkgdir}/usr/bin/set-nc-perms"
  install -m644 -D "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/nextcloud"
  ln -s /usr/share/webapps/nextcloud/occ "${pkgdir}/usr/bin/occ"
}

# vim:set ts=2 sw=2 et:
