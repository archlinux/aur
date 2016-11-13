# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=owncloud-archive
pkgver=9.1.2
pkgrel=1
pkgdesc="ownCloud server release, installed from the official .tar.bz2 archive"
url="https://owncloud.org"
arch=('any')
license=('GPL')
conflicts=('owncloud')
provides=('owncloud')
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
backup=('etc/webapps/owncloud/apache.example.conf')
install=${pkgname}.install
validpgpkeys=('E3036906AD9F30807351FAC32D5D5E97F6978A26')
source=("https://download.owncloud.org/community/owncloud-${pkgver}.tar.bz2"{,.asc}
  "apache.example.conf"
  "set-oc-perms.sh")
md5sums=('2d4a1c6b23e616e98cef28e0db6ea4aa'
         'SKIP'
         'bf523e475fd8cf1e2048018952da5c34'
         '1ca5504c1b32fbbbe7b1710db6779744')

options=(!strip emptydirs)

prepare() {
  cd "${srcdir}/owncloud"
}

package() {
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  cp "${srcdir}"/owncloud/COPYING-* "${pkgdir}/usr/share/licenses/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a owncloud "${pkgdir}/usr/share/webapps/."
 
  install -D -m755 "${srcdir}/set-oc-perms.sh" "${pkgdir}/usr/bin/set-oc-perms"
  install -m644 -D "${srcdir}/apache.example.conf" -t "${pkgdir}/etc/webapps/owncloud"
  ln -s /usr/share/webapps/owncloud/occ "${pkgdir}/usr/bin/occ"
}

# vim:set ts=2 sw=2 et:
