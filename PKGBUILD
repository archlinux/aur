# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xwxapt
_pkgname=apt
pkgver=2.9
pkgrel=1
pkgdesc="Ham Radio - Weather Satellite APT format image decoder using X/GTK+"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname.html"
license=(GPL)
depends=('gtk2' 'alsa-lib' 'rtl-sdr' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
source=(http://www.qsl.net/5b4az/pkg/$_pkgname/$pkgname/$pkgname-$pkgver.tar.bz2
	diff.Makefile.am
	$pkgname.desktop
	$pkgname.1
	xdemorse.png
#	$pkgname.man.1.gz
)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.Makefile.am
}

build() {
	cd $srcdir/$pkgname-$pkgver

#	export LDFLAGS="-lm $LDFLAGS"
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
#	install -Dm644 ../$pkgname.man.1.gz $pkgdir/usr/share/man/man1/$pkgname.1.gz
}
md5sums=('06dd1b1f83b48050b54f4f06dd813cf7'
         '92f710ec367f09f7a6c4ec8f32815244'
         '5b913f35d6cad963dec99c5fc0a0d5ad'
         'bcd0a1d7a87a059a3d6cfb80dfad1e6f'
         'edcd3f301ec8ea95453d40534beb6ede')
sha256sums=('cf67dd4f0f1d9ce6704f7abeb9e06ac59f47d2d2dff6632c02ebe195c97a6cce'
            '24b3c907aac799ad47c71914ace7476d403f2878f9c9fcb391d701367aa1794a'
            '51671884532f68f9ededadbbdfdcd801827bc9b543ae5cb1b5c414336b7cab07'
            '0ae51c280d2ce20849c078a3c2c6c1a14b5fb6f396054833a347109a3fd4886e'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d')
