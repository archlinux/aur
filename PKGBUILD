# Maintainer: éclairevoyant

pkgname=lychee-photo-management
pkgver=4.10.0
pkgrel=1
pkgdesc="Easy to use and great looking photo management system"
arch=(any)
url="https://lycheeorg.github.io/"
license=(MIT)
depends=('php>=8.1' php-gd)
makedepends=(git)
optdepends=(php-apache nginx mysql postgresql)
options=('!strip' emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LycheeOrg/Lychee/archive/v$pkgver.tar.gz"
        apache.example.conf)
b2sums=('341b45a50aece42483f0d99ddf7873f821727e69f8f0297f215cde236f55afb1113b09e822ca024a137ce028e50f9bddba96559eb68683cfd632abe974bb099b'
        'd989b2940b26787315d08ea40bf23184de09b66c4d400da4022cedf24daa09596eb8841afee3aa7f984d28dc15968b76f0048a1c436b0cf2a27f1cbfa0bde31e')

package() {
	install -d "$pkgdir"/usr/share/webapps/
	cp -a Lychee-$pkgver "$pkgdir"/usr/share/webapps/$pkgname

	find "$pkgdir"/usr/share/webapps/$pkgname -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/webapps/$pkgname -type d -exec chmod 0755 {} \;

	install -Dm644 apache.example.conf -t "$pkgdir/etc/webapps/$pkgname/"
}
