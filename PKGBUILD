

pkgname=lychee-photo-management
pkgver=4.3.0
pkgrel=1
pkgdesc="Lychee is an easy to use and great looking photo-management-system."
arch=('any')
url="https://lycheeorg.github.io/"
license=('MIT')
depends=('php' 'php-gd' 'mariadb')
optdepends=('php-apache: to use the Apache web server')
makedepends=()
options=('!strip' emptydirs)
backup=('etc/webapps/lychee/apache.example.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LycheeOrg/Lychee/archive/v$pkgver.tar.gz"
	'apache.example.conf')
sha256sums=('d905cfee8c670e42566b9681d189a0714fa2f29b3e212cd9022ee9244288f1ed'
            '0a68524551049320c6a58177baeb4592041970b3892ae0eeca405a3f75706701')

package() {
  # install project
  install -d ${pkgdir}/usr/share/webapps/
  cp -a ${srcdir}/Lychee-$pkgver ${pkgdir}/usr/share/webapps/${pkgname}

  # install apache config file
  install -d  ${pkgdir}/etc/webapps/${pkgname}
  install -m 644 ${srcdir}/apache.example.conf  ${pkgdir}/etc/webapps/${pkgname}

  find ${pkgdir}/usr/share/webapps/${pkgname} -type f -exec chmod 0644 {} \;
  find ${pkgdir}/usr/share/webapps/${pkgname} -type d -exec chmod 0755 {} \;

#  chmod -R 777 ${pkgdir}/usr/share/webapps/${pkgname}/data
#  chmod -R 777 ${pkgdir}/usr/share/webapps/${pkgname}/uploads
}
