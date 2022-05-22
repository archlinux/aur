# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
#
pkgname=osticket
pkgver=1.16.2
pkgrel=1
pkgdesc='A widely-used open source support ticket system.'
arch=('any')
url='http://www.osticket.com/'
license=('GPL')
depends=('php' 'php-apache' 'mariadb')
makedepends=('unzip')
install="${pkgname}.install"
source=("https://github.com/osTicket/osTicket/releases/download/v$pkgver/osTicket-v$pkgver.zip")
sha256sums=('4d6ff94837a70e5237ed89828240243e8cab8d956ae97fd7f020a2c71dbc64b3')

package() {
  cd $srcdir

  # make destination directory
  install -d ${pkgdir}/usr/share/webapps/${pkgname} 

  # unzip into right folder
  sleep 1
  echo "Extracting files"
  sleep 1
  unzip -d ${pkgdir}/usr/share/webapps/${pkgname} "osTicket-v$pkgver"

  # fix permissions (probably needs to get included upstream)
  find ${pkgdir}/usr/share/webapps/$pkgname -type f -exec chmod 0664 {} \; 
  find ${pkgdir}/usr/share/webapps/$pkgname -type d -exec chmod 0775 {} \;
}
