# Maintainer: éclairevoyant

pkgname=lychee-photo-management
pkgver=4.7.0
pkgrel=1
pkgdesc="Easy to use and great looking photo management system"
arch=('any')
url="https://lycheeorg.github.io/"
license=('MIT')
depends=('php>=8.1' 'php-gd' 'mariadb')
optdepends=('php-apache: to use the Apache web server')
options=('!strip' emptydirs)
backup=('etc/webapps/lychee/apache.example.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/LycheeOrg/Lychee/archive/v$pkgver.tar.gz"
        'apache.example.conf')
b2sums=('00a0c4e353f8186f5c46da3691e4f67bdd124ca485ee3c9667755151e010af0eeb015dd28d99de7f04a463559289a405919db0559c7f65a1ef324dd6e633312d'
        'd989b2940b26787315d08ea40bf23184de09b66c4d400da4022cedf24daa09596eb8841afee3aa7f984d28dc15968b76f0048a1c436b0cf2a27f1cbfa0bde31e')

package() {
	install -d "$pkgdir"/usr/share/webapps/
	cp -a Lychee-$pkgver "$pkgdir"/usr/share/webapps/$pkgname

	find "$pkgdir"/usr/share/webapps/$pkgname -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/webapps/$pkgname -type d -exec chmod 0755 {} \;

	install -Dm644 apache.example.conf -t "$pkgdir"/etc/webapps/$pkgname/
}
