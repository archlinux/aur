# Developer: Amamiya Shinki <jingtian30000@gmail.com>
# Maintainer: Dustin Van Tate Testa <toast27@gmail.com>

pkgname=marisahttpd-git
pkgver=0.4.r35.g45274d1 # changes after makepkg (based on git versioning)
pkgrel=1
license=('GPL')
pkgdesc="High-effiency dynamic webpage server and runtime for C/C++"
url="https://github.com/AmamiyaRinyuki/MarisaHttpd"

arch=('any')

makedepends=('git' 'libmicrohttpd')

provides=("marisa")

source=("$pkgname::git+https://github.com/AmamiyaRinyuki/MarisaHttpd")

md5sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
	cd $pkgname

	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin/
	mkdir $pkgdir/usr/lib/

	gcc -shared -fpic src/kirisame.c -o $pkgdir/usr/lib/libkirisame.so
	gcc src/marisa.c src/grimoire.c src/magicshop.c src/kirisame.c -ldl -lm -lpthread -lmicrohttpd -o $pkgdir/usr/bin/marisa

	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE

}
