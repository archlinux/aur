# Maintainer: éclairevoyant

pkgname=lychee-photo-management
pkgver=4.11.1
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
b2sums=('76e422bc4c9ac59910f0dd47f49a78814350f796845d66081c4f7034f7b6d9cf7a07e16368a99c44a8cd67ad94b102cc7ccb348c159876881bedfb61816ed584'
        'd989b2940b26787315d08ea40bf23184de09b66c4d400da4022cedf24daa09596eb8841afee3aa7f984d28dc15968b76f0048a1c436b0cf2a27f1cbfa0bde31e')

package() {
	install -d "$pkgdir"/usr/share/webapps/
	cp -a Lychee-$pkgver "$pkgdir"/usr/share/webapps/$pkgname

	find "$pkgdir"/usr/share/webapps/$pkgname -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/webapps/$pkgname -type d -exec chmod 0755 {} \;

	install -Dm644 apache.example.conf -t "$pkgdir/etc/webapps/$pkgname/"
}
