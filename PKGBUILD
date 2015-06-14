pkgname=irker
pkgver=2.13
pkgrel=1

pkgdesc="IRC client daemon accepting JSON notification requests"
url="http://www.catb.org/esr/irker/"
arch=('any')
license=('BSD')

depends=('python2')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')

source=("http://www.catb.org/~esr/irker/irker-$pkgver.tar.gz")

sha1sums=('11be24fcc15d8d607b85527050b693b3ca0dc968')

build() {
	cd irker-$pkgver
	sed -i '1s|python|python2|' irk irkerd irkerhook.py
	make
}

package() {
	cd irker-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm 755 irkerhook.py "$pkgdir"/usr/bin/irkerhook.py
	install -Dm 755 irk "$pkgdir"/usr/bin/irk
	install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/irker/LICENSE
}
