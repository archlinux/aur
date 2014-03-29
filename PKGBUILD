# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Josh Cartwright <joshc@eso.teric.us>

pkgname=irker
pkgver=2.7
pkgrel=1

pkgdesc="An IRC client daemon accepting JSON notification requests presented to a socket."
arch=('any')
url="http://www.catb.org/esr/irker/"
license=('BSD')

depends=('python2')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')

source=("http://www.catb.org/~esr/irker/$pkgname-$pkgver.tar.gz")
md5sums=('34dc7b64d20c18d9e50806501a441213')

build() {
	cd irker-$pkgver
	sed -i '1s|python|python2|' irk irkerd irkerhook.py
	make
}

package() {
	cd irker-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm 755 irkerhook.py "$pkgdir/usr/bin/irkerhook.py"
	install -Dm 755 irk "$pkgdir/usr/bin/irk"
	install -Dm 644 COPYING "$pkgdir/usr/share/licenses/irker/LICENSE"
}
