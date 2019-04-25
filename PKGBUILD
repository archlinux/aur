# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Sigmund Vestergaard <sigmundv at gmail dot com>
#
pkgname=osticket
pkgver=1.12
pkgrel=2
pkgdesc='A widely-used open source support ticket system.'
arch=('any')
url='http://www.osticket.com/'
license=('GPL')
depends=('php' 'php-apache' 'mariadb')
makedepends=('unzip')
install="${pkgname}.install"
source=("https://github.com/osTicket/osTicket/releases/download/v$pkgver/osTicket-v$pkgver.zip")
sha256sums=('2cd2ee76f107d58586d5bf57ad5d7daabf56ce51692b9ec7f5a99eacb61a45f9')

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
