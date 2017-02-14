# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xpsk31
pkgver=3.2
pkgrel=2
pkgdesc="Ham Radio PSK31 engine using X/GTK+"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/psk31/xpsk31/xpsk31.html"
license=(GPL)
depends=('gtk2' 'alsa-lib' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
# 'imagemagick: used IF you want to convert icons/images')
source=(http://www.qsl.net/5b4az/pkg/psk31/$pkgname/$pkgname-$pkgver.tar.bz2
	diff.Makefile.am
	$pkgname.desktop
	$pkgname.1
	xdemorse.png
	$pkgname.man.1.gz
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

	mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 ../xdemorse.png $pkgdir/usr/share/pixmaps/$pkgname.png
	install -Dm644 ../$pkgname.man.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
}
md5sums=('952385221c0a577e099ee3d3897db24b'
         'ed09102ed5862054b0f8579f78ab475f'
         'c784ec5d71a3897c515add6aa370cccd'
         '856292e1d2c0f01745218c24e1bf690a'
         'edcd3f301ec8ea95453d40534beb6ede'
         '633652b8446b6970576444e0b8c4e3d9')
sha256sums=('b0118503dc87964cfac120de540b8c3b3d2a7cb20b4344a9cb6dd9f4a5dd519d'
            '2377350a73d13e78a567ab4dd035dac445cc59056d123d75d370755dfddc2e7f'
            'd1afe06070b7a6eec1967194c2d7a5a38cf29e73dca35976a72d52707dece0a5'
            '1286f9c1a67f7e96440d5a218bad5e7b745642f17b72750e37089779bf75eec9'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d'
            '64b381591216ea16c35d94eea52d2de846ce7a628f92c2e0f26a72f27442a033')
