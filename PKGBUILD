# Maintainer: éclairevoyant

pkgname=lychee-photo-management
pkgver=5.1.2
pkgrel=1
pkgdesc="Easy to use and great looking photo management system"
arch=(any)
url="https://lycheeorg.github.io/"
license=(MIT)
depends=('php>=8.2' php-gd)
makedepends=(git)
optdepends=(php-apache nginx mysql postgresql)
options=('!strip' emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LycheeOrg/Lychee/archive/v$pkgver.tar.gz"
        apache.example.conf)
b2sums=('dd590ff9544fa9f5be753a6f30e2f005916e81e350e51896ee6d9ee99636059c27ee30f69f253ee3816ba7e713e5927a527d3ddfa9f1e7974a38203dbd713e4e'
        'd989b2940b26787315d08ea40bf23184de09b66c4d400da4022cedf24daa09596eb8841afee3aa7f984d28dc15968b76f0048a1c436b0cf2a27f1cbfa0bde31e')

package() {
	install -d "$pkgdir"/usr/share/webapps/
	cp -a Lychee-$pkgver "$pkgdir"/usr/share/webapps/$pkgname

	find "$pkgdir"/usr/share/webapps/$pkgname -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/webapps/$pkgname -type d -exec chmod 0755 {} \;

	install -Dm644 apache.example.conf -t "$pkgdir/etc/webapps/$pkgname/"
}
