# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xwefax
pkgver=2.4.4
pkgrel=1
pkgdesc="Ham Radio WEFAX/RadioFAX engine using X/GTK+"
arch=('i686' 'x86_64' 'aarch64')
url="http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname.html"
license=(GPL)
depends=('gtk3' 'alsa-lib' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config')
source=(http://www.qsl.net/5b4az/pkg/$pkgname/$pkgname-$pkgver.tar.bz2
	$pkgname.desktop
	$pkgname.1
	xwefax.png
)

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
#	make -i check	# sadly the intl. files. are not correct (sigh)
}

package() {
	cd $srcdir/$pkgname-$pkgver

	mkdir -p $pkgdir/usr/share/doc/$pkgname/examples/
	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -Dm755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	install -Dm644 $pkgname/xwefaxrc $pkgdir/usr/share/doc/$pkgname/examples/xwefaxrc.example
	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 ../$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('f23299ebcd74211dd9c14670e6dc60ae'
         '056d9bf5d23fe76173e8729f534979ba'
         '0b707aca93887492e95f4638830f183f'
         'd6657f45025d99c8a70c043fe61c195f')
sha256sums=('22a1e403f98eb289be977df2a4872bb7634bc6d267bad5067be95662b55da28a'
            '5051c88dff458f8dd2478a93b9c2ba6e43cfcaf7ddff8103d5b18f1f9235378b'
            '0ba663d873218f317467e0036acbe8bdbb34def4e09581b9e8b48accdab56ce4'
            '37658a7df89c9e97e2fc927c391260fe633ffdce133f4f57a2b3ed3d41afe417')
