pkgname=jabrss-svn
pkgver=r1574
pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
	printf "r%s" "$(svnversion | tr -d 'A-z')"
}
pkgrel=1
pkgdesc="RSS jabber bot"
arch=(any)
url="https://dev.cmeerw.org/Projects/jabrss"
license=('GPL')
depends=()
source=("$pkgname::svn+http://svn.cmeerw.net/src/jabrss/trunk/")
sha256sums=('SKIP')

package() {
	install -dm0755 "$pkgdir"/{usr/lib,var/db/jabrss}
	cp -a "$srcdir/${pkgname}" "$pkgdir"/usr/lib/jabrss
	cd "$pkgdir"/var/db/jabrss
	sqlite3 jabrss.db <"$pkgdir"/usr/lib/jabrss/db.sqlite
	ln -s /var/db/jabrss/jabrss.db "$pkgdir"/usr/lib/jabrss
	ln -s /var/db/jabrss/jabrss_res.db "$pkgdir"/usr/lib/jabrss
	chown -R nobody:nobody "$pkgdir"/var/db/jabrss
}
