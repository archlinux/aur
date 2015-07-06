# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=lpsk31
pkgver=1.2
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
md5sums=('63d2d1179471d20db68da07c5f9aa753'
         'b8af15926c83bd27953adde1d64b4056'
         '79a47571a671ad09a34f95b9079022c9'
         'cbb6e25ca737f53274c85c348e1809a6')
sha256sums=('57397bcbe618ce2a740f3d5aea2d661679135360f26456ed7588e2783f096ebf'
            'eaed47056fdfc43bf4fb789d035ed646aedc6bca6e84efe5907b7753865008ab'
            '8a341201472d67564fa26e867f2ce5fad835ecd6a96ecbf0f02bd7003bef6b93'
            'bd8ded7822a781c6e678255f2609560f6a0163a722f04e94306d7fb18a5b4c4b')
