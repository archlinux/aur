pkgname=eternalnightmare
pkgver=5.1
pkgrel=3
pkgdesc="Chrono Trigger randomizer"
arch=(any)
url="https://github.com/abyssonym/eternalnightmare"
license=("unknown")
source=("$pkgname.zip::https://github.com/abyssonym/eternalnightmare/archive/d8b24aa4aea90064e1e2b8c329ae3f60f25a2ac4.zip"
"$pkgname.sh")
depends=(python2-randomtools)
makedepends=(dos2unix python2)
md5sums=('e1867f5ab67f79b12ef13ff98fec0dca'
         'ed3cf3d1b1e771fcf6462cb48ae1b607')

prepare() {
	cd $pkgname-*
	find . -type f -exec dos2unix {} \;
}

package() {
	cd $pkgname-*
	install -Dm755 randomizer.py "$pkgdir/usr/share/$pkgname/randomizer.py"
	find . -name '*.txt' -exec install -Dm644 {} "$pkgdir/usr/share/$pkgname/"{} \;
	rm -r randomtools
	ln -s /usr/lib/python2.7/site-packages/randomtools .
	python2 -m compileall "$pkgdir"
	install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
