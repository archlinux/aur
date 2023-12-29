# Maintainer: éclairevoyant

pkgname=lychee-photo-management
pkgver=5.0.2
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
b2sums=('d88e55e8e1ef769626be2f7d85f3734d6adb01ea7e6f7638d29fb3960425682a8dffeb6576c377eb6f6aa30fdb9d89abf88012d36208657dcc4d66b55f0f6f32'
        'd989b2940b26787315d08ea40bf23184de09b66c4d400da4022cedf24daa09596eb8841afee3aa7f984d28dc15968b76f0048a1c436b0cf2a27f1cbfa0bde31e')

package() {
	install -d "$pkgdir"/usr/share/webapps/
	cp -a Lychee-$pkgver "$pkgdir"/usr/share/webapps/$pkgname

	find "$pkgdir"/usr/share/webapps/$pkgname -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/webapps/$pkgname -type d -exec chmod 0755 {} \;

	install -Dm644 apache.example.conf -t "$pkgdir/etc/webapps/$pkgname/"
}
