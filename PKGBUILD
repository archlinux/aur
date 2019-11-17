# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=lpsk31
pkgver=1.3
pkgrel=1
pkgdesc="Ham Radio - Ncurses psk31 engine + min. FT847 cat info."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/psk31/lpsk31/lpsk31.html"
license=('GPL3')
depends=('bash' 'alsa-lib')
source=(http://www.qsl.net/5b4az/pkg/psk31/$pkgname/$pkgname-$pkgver.tar.bz2
	diff.Makefile
	$pkgname
	$pkgname.man.1.gz
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.Makefile
	# You can customize display items in lpsk31.h. See doc/lpsk31.html . 
}

build() {
	cd $srcdir/$pkgname-$pkgver

	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver

	# Consider modifying the Makefile to use its' install info.

	install -Dm755 ../lpsk31 $pkgdir/usr/bin/lpsk31
	install -Dm755 lpsk31 $pkgdir/usr/bin/lpsk31.1

	install -Dm644 default/lpsk31rc $pkgdir/usr/share/$pkgname/lpsk31rc

	install -Dm644 ../$pkgname.man.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
	install -Dm644 doc/$pkgname.html $pkgdir/usr/share/doc/$pkgname/$pkgname.html
	install -Dm644 doc/*.pdf $pkgdir/usr/share/doc/$pkgname/.

	# Consider making/adding .desktop file (et al) to add this to the "menus".
}
md5sums=('091ecabd1921c53249e6e85ca45eb2c0'
         'b8af15926c83bd27953adde1d64b4056'
         'e6e5e78f311d8ea91834c9832f8ea67f'
         'cbb6e25ca737f53274c85c348e1809a6')
sha256sums=('b19926cc66ab341b610e2ac2ffbfda5b765bc21b3d83b3eecdae3e0f67f7f855'
            'eaed47056fdfc43bf4fb789d035ed646aedc6bca6e84efe5907b7753865008ab'
            '5f411d1fb9500446e2c20591f7050d15d85b1964672fd0fbf3a9b59feaabce76'
            'bd8ded7822a781c6e678255f2609560f6a0163a722f04e94306d7fb18a5b4c4b')
