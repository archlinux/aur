# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Maintainer: qs9rx <that nick at enjoys döt it>
# Original Contributor: Bob Finch <w9ya@arrl.net>
# Original author: Bennett Goble <nivardus at gmail dot com>

pkgname=xdemorse
pkgver=3.6.5
pkgrel=1
pkgdesc="An X/GTK+ application - decodes Morse Code signals into text."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/morse/xdemorse/xdemorse.html"
license=(GPL)
depends=('gtk3' 'hamradio-menus' 'alsa-lib')
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
md5sums=('be235ea4af07c3b77443937e484cc402'
         'abb9f6e6510c9f747d70c738eeb5a824'
         '568d6a9bc01dc76a39408dc93ac094a1')
sha256sums=('9d763eb303990038905412a846da7e836dbe865397cbc99e93227be6509691c6'
            '1a690f6c7fdb73be3ebcedb59390faf74fcfb5f71484290d9d5a682650d3c9b1'
            '8aead0451f0c0ef8158b89654882c27b9fe6836beac6ecf2e7e0840b4cd4ec39')
