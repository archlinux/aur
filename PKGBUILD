# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=owncloud-archive
pkgver=9.0.1
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
source=("https://download.owncloud.org/community/owncloud-${pkgver}.tar.bz2"{,.asc} "apache.example.conf")
md5sums=('1ce7ad9f4970b0cd64a23af0bbe280d9'
         'SKIP'
         'bf523e475fd8cf1e2048018952da5c34')

options=(!strip emptydirs)

package() {
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/owncloud/COPYING-* ${pkgdir}/usr/share/licenses/${pkgname}

  mkdir -p "${pkgdir}/usr/share/webapps"
  cp -a owncloud "${pkgdir}/usr/share/webapps/."
  
  install -m644 -D ${srcdir}/apache.example.conf -t ${pkgdir}/etc/webapps/owncloud
  mkdir -p ${pkgdir}/usr/bin
  ln -s /usr/share/webapps/owncloud/occ ${pkgdir}/usr/bin/occ
}

# vim:set ts=2 sw=2 et:
