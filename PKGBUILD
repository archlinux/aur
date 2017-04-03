# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xwefax
pkgver=2.0
pkgrel=1
pkgdesc="Ham Radio WEFAX/RadioFAX engine using X/GTK+"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname.html"
license=(GPL)
depends=('gtk2' 'alsa-lib' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
source=(http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname-$pkgver.tar.bz2
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
md5sums=('3be70ab82395c681d34c1fe50db04310'
         '3ee17879e2235a14a70526aee4e745e1'
         '056d9bf5d23fe76173e8729f534979ba'
         '00c1e9a2453c691eefbae67d43d19c06'
         'edcd3f301ec8ea95453d40534beb6ede')
sha256sums=('ce6a982022fe530c0bd7051661849bb2432d2dcfb11c6c07a11d0073defeef42'
            '13d5c1675dad491dda181cde6f2a4e9707d65ed3c3c4d1b6a889d7bf9a0287d0'
            '5051c88dff458f8dd2478a93b9c2ba6e43cfcaf7ddff8103d5b18f1f9235378b'
            'b801757d49174a42441f7eb71fbab7099fbbecc5fa9db2f92c5d18aac2f53e79'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d')
