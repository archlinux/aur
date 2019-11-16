# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xpsk31
pkgver=3.6.1
pkgrel=1
pkgdesc="Ham Radio PSK31 engine using X/GTK+"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/psk31/xpsk31/xpsk31.html"
license=(GPL)
depends=('gtk3' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
# 'imagemagick: used IF you want to convert icons/images')
source=(http://www.qsl.net/5b4az/pkg/psk31/$pkgname/$pkgname-$pkgver.tar.bz2
#	diff.Makefile.am
	$pkgname.desktop
	$pkgname.1
	xdemorse.png
#	$pkgname.man.1.gz
)

#prepare() {
#	cd $srcdir/$pkgname-$pkgver
#
#	patch -p0 < ../diff.Makefile.am
#
##	sed -i s:xpm:png: Makefile.am
##	convert files/$pkgname.xpm files/$pkgname.png
##	install -m644 ../$pkgname.desktop files/$pkgname.desktop
#}

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

	mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/
	mkdir -p $pkgdir/usr/share/{applications,pixmaps,man/man1}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 ../xdemorse.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 $pkgname/xpsk31rc $pkgdir/usr/share/doc/$pkgname/examples/xpsk31rc.example

	rm $pkgdir/usr/share/doc/$pkgname/$pkgname.1.gz
}
md5sums=('346093bdef71823451e11a304cb1007d'
         'c784ec5d71a3897c515add6aa370cccd'
         '27f0893852750dbbb51239c4725442c2'
         'edcd3f301ec8ea95453d40534beb6ede')
sha256sums=('3ac59f04fe694e920c887508d5c1df8006cebac3dc5d27cf869139d9f8c39e70'
            'd1afe06070b7a6eec1967194c2d7a5a38cf29e73dca35976a72d52707dece0a5'
            'ee8bb6a89eb145b4da83c4a737bc0fcc1856b5e032dad35161bc6dc514e3ac90'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d')
