pkgname=irker
pkgver=2.18
pkgrel=1

pkgdesc="IRC client daemon accepting JSON notification requests"
url="http://www.catb.org/esr/irker/"
arch=('any')
license=('BSD')

depends=('python2')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')

source=("http://www.catb.org/~esr/irker/irker-$pkgver.tar.gz")

md5sums=('41b3734439caf4b3263e0c6ef148b38b')

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
