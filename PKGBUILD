# Maintainer: éclairevoyant

pkgname=lychee-photo-management
pkgver=4.9.4
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
b2sums=('e01ce702c4489ea7154039859d96ecee25240c71b83fd669e36464dee41bbcedfe48d55d23d86547add81189676489d6d07fe5934cd5e4949309bb6682851c43'
        'd989b2940b26787315d08ea40bf23184de09b66c4d400da4022cedf24daa09596eb8841afee3aa7f984d28dc15968b76f0048a1c436b0cf2a27f1cbfa0bde31e')

package() {
	install -d "$pkgdir"/usr/share/webapps/
	cp -a Lychee-$pkgver "$pkgdir"/usr/share/webapps/$pkgname

	find "$pkgdir"/usr/share/webapps/$pkgname -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/webapps/$pkgname -type d -exec chmod 0755 {} \;

	install -Dm644 apache.example.conf -t "$pkgdir/etc/webapps/$pkgname/"
}
