pkgname=eternalnightmare
pkgver=5.1
pkgrel=1
pkgdesc="Chrono Trigger randomizer"
arch=(any)
url="https://github.com/abyssonym/eternalnightmare"
license=("unknown")
source=("$pkgname.zip::https://github.com/abyssonym/eternalnightmare/archive/c404fadc7613dcb25210b0b22770c2f16c9cf9c9.zip"
"$pkgname.sh")
depends=(python2-randomtools)
makedepends=(dos2unix python2)


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
md5sums=('c62cac3e860e6a884139d5be939a287a'
         '09a5882ff282397e2657312d2a27f3b5')
