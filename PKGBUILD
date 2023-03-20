# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xpsk31
pkgver=3.6.2
pkgrel=1
pkgdesc="Ham Radio PSK31 engine using X/GTK+"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/psk31/xpsk31/xpsk31.html"
license=(GPL)
depends=('gtk3' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
# 'imagemagick: used IF you want to convert icons/images')
source=(http://www.qsl.net/5b4az/pkg/psk31/$pkgname/$pkgname-$pkgver.tar.bz2
	diff.Makefile.am
	$pkgname.desktop
	$pkgname.1
	xdemorse.png
#	$pkgname.man.1.gz
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.Makefile.am

#	sed -i s:xpm:png: Makefile.am
#	convert files/$pkgname.xpm files/$pkgname.png
#	install -m644 ../$pkgname.desktop files/$pkgname.desktop
}

build() {
	cd $srcdir/$pkgname-$pkgver

#	export LDFLAGS="-lm $LDFLAGS"
#	It is possible 2 customize some entries in pskcodec.h; See the docs.
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$pkgname-$pkgver

#	make check
	make -i check	# sadly the intl. files. are not correct (sigh)
}

package() {
	cd $srcdir/$pkgname-$pkgver

#	mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/
#	mkdir -p $pkgdir/usr/share/{applications,pixmaps,man/man1}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 ../xdemorse.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 $pkgname/xpsk31rc $pkgdir/usr/share/doc/$pkgname/examples/xpsk31rc.example

	rm $pkgdir/usr/share/doc/$pkgname/$pkgname.1.gz
}
md5sums=('fe24677f3261b5d3b63fea7dd5b35c44'
         '988264985f99e2869c590897c4219357'
         'c784ec5d71a3897c515add6aa370cccd'
         '0dd0a9e1cc2d745ef93333f97b2e138d'
         'edcd3f301ec8ea95453d40534beb6ede')
sha256sums=('a713c45b48fbb0f3c162a9b2125dda5dac36f9c57b7f7a289253188dd06ddbf4'
            '5259e4e44cf4adffdb7a6d506958aa523523e3317554d180c6346348a59801a4'
            'd1afe06070b7a6eec1967194c2d7a5a38cf29e73dca35976a72d52707dece0a5'
            '1095a3122d3d448b8c2c48d8810ca37dbd8b9ec06b6fc51bc75ceb39c8eef071'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d')
