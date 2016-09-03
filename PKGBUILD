pkgname=eternalnightmare
pkgver=5.2
pkgrel=1
pkgdesc="Chrono Trigger randomizer"
arch=(any)
url="https://github.com/abyssonym/eternalnightmare"
license=("unknown")
source=("$pkgname.zip::https://github.com/abyssonym/eternalnightmare/archive/c80002a7ecd546f553817890dcd79383550a94ea.zip"
"$pkgname.sh")
depends=(python2-randomtools)
makedepends=(dos2unix python2)
md5sums=('086d7fe03a3bc3b4928a5029b5878fa4'
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
