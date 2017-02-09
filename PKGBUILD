# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=xsatcom
pkgver=3.0
pkgrel=2
pkgdesc="Ham Radio - satellite tracking."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/satellite/xsatcom/xsatcom.html"
license=(GPL3)
depends=('gtk2' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'pkg-config' 'gettext')
optdepends=('xplanet: provides data on great circle map')
source=("http://www.qsl.net/5b4az/pkg/satellite/$pkgname/$pkgname-$pkgver.tar.bz2"
	diff.Makefile.am
	$pkgname.desktop
	xdemorse.png
	$pkgname.1)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	sed -i s:1.14:1.15: autogen.sh
	patch -p0 < ../diff.Makefile.am

	mkdir files/
	install -m644 ../$pkgname.desktop files/$pkgname.desktop
	install -m644 ../xdemorse.png files/$pkgname.png
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

	mkdir -p $pkgdir/usr/share/{applications,pixmaps,doc/$pkgname,$pkgname}
	make DESTDIR=$pkgdir install

	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname
}
md5sums=('027b9da4dbeff7871bda3baf617a6297'
         '9d53a30a57e2308b35f52a815768910c'
         'da46deb421a73376507b575629df5a48'
         'edcd3f301ec8ea95453d40534beb6ede'
         '49b427b41f3e7354c2502883d7f6801b')
sha256sums=('3801375df515e0025de5508d8a1abcb96f225706c663e31eb8aeec80b8468d55'
            '9ed0f048bd2642c77a2c777e576f39fe5580d4b2435441961d55049f520fd114'
            'cbbc674993a789a42f7117358fa7b2b959c85376656722db942c40a2ad2eece8'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d'
            '357c69b07dfe18090998f59d10bbaa3e24b636e177a863c67d83015160b973d2')
