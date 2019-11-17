# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Maintainer: qs9rx <that nick at enjoys döt it>
# Original Contributor: Bob Finch <w9ya@arrl.net>
# Original author: Bennett Goble <nivardus at gmail dot com>

pkgname=xdemorse
pkgver=3.6.2
pkgrel=1
pkgdesc="An X/GTK+ application - decodes Morse Code signals into text."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/morse/xdemorse/xdemorse.html"
license=(GPL)
depends=('gtk3' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'imagemagick' 'pkg-config')
source=("http://www.qsl.net/5b4az/pkg/morse/$pkgname/$pkgname-$pkgver.tar.bz2"
#	diff.autogen.sh
	$pkgname.desktop
	$pkgname.1
)

#prepare() {
#	cd $srcdir/$pkgname-$pkgver
#
#	patch -p0 < ../diff.autogen.sh
#	sed -i s:xpm:png: Makefile.am
#	convert files/$pkgname.xpm files/$pkgname.png
#	install -m644 ../$pkgname.desktop files/$pkgname.desktop
#}

build() {
	cd $srcdir/$pkgname-$pkgver

#	export LDFLAGS="-lm $LDFLAGS"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$pkgname-$pkgver

	make check
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/
	mkdir -p $pkgdir/usr/share/{applications,pixmaps,man/man1}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 .$pkgname/xdemorserc $pkgdir/usr/share/doc/$pkgname/examples/xdemorserc.example

	rm $pkgdir/usr/share/doc/$pkgname/$pkgname.1.gz
}
md5sums=('068cfd1e944269f8060ffbb603a60fcb'
         'abb9f6e6510c9f747d70c738eeb5a824'
         '24377210d07bb855d47993245fbea03b')
sha256sums=('8abecc219fd8293963766457e0fa952f7be715f7c8837bdcaa45a890829aebd4'
            '1a690f6c7fdb73be3ebcedb59390faf74fcfb5f71484290d9d5a682650d3c9b1'
            'ac206099b5f44dd33acca7beedb821f025dfc08be48d4e54ab21ffd081d5e5f8')
