pkgname=mymc
pkgver=2.6
pkgrel=9
pkgdesc="A public domain utility for working with PlayStation 2 memory card images"
arch=(any)
url="http://www.csclub.uwaterloo.ca:11068/mymc"
license=("public domain")
source=("mymc.zip::https://github.com/Ben0mega/mymc/archive/04dd9c490b0d8b59e6bae2e60284e29c1fc2e448.zip"
"mymc.sh"
"mymc-gui.sh"
"mymc.desktop"
"mymc.png")
depends=(wxpython)
makedepends=(dos2unix python2)
md5sums=('20ac84e48c337f1b99c1d9725cc7e0f4'
         '0e546fd12536a089d3bd67e27ff1d1ac'
         '5c8c4d84a9a180201680d86ec731e999'
         '77e983041fbb0d9b19ab16e8e94ad205'
         '4aa6feff98d1a76b4c5ac7d05118655d')

prepare() {
	cd "$srcdir/mymc-"*
	find . -type f -exec dos2unix {} \;
}

package() {
	cd "$srcdir/mymc-"*
	find . -name '*.py' -o -name '*.txt' | xargs -rtl1 -I {} install -Dm755 {} "$pkgdir/usr/share/mymc/"{}
	python2 -m compileall "$pkgdir/usr/share/mymc"
	install -Dm755 "$srcdir/mymc.sh" "$pkgdir/usr/bin/mymc"
	install -m755 "$srcdir/mymc-gui.sh" "$pkgdir/usr/bin/mymc-gui"
	install -Dm644 "$srcdir/mymc.desktop" "$pkgdir/usr/share/applications/mymc.desktop"
	install -Dm644 "$srcdir/mymc.png" "$pkgdir/usr/share/icons/mymc.png"
	install -Dm644 README.txt "$pkgdir/usr/share/licenses/$pkgname/README.txt"
}
