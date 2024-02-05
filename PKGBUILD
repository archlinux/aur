# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xgridloc
pkgver=1.8.4
pkgrel=1
pkgdesc="Ham Radio Maidenhead grid converter & bearing + distance calculator"
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/locator/xgridloc/xgridloc.html"
license=('GPL3')
depends=('gtk3' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'gettext'
# 'imagemagick'
 'pkg-config')
optdepends=('xplanet: provides visual path on great circle map')
#		^^^  see xgridloc's html (in the doc dir.) 4 instructions
source=("http://www.qsl.net/5b4az/pkg/locator/$pkgname/$pkgname-$pkgver.tar.bz2"
	$pkgname.desktop
	xdemorse.png)

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

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	make DESTDIR=$pkgdir install

	install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 ../xdemorse.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('5b0f958fd00845683ab631f6b08c0d6b'
         'f4da450b0dd9f4c996bf38ab7985feb9'
         'edcd3f301ec8ea95453d40534beb6ede')
sha256sums=('0333e160fa5ed0a7d3aa2f80904bb48b2a16455439f2896a49d2695dfccaaddb'
            '2258247e36111af347a7067630f5b0736a4ea6932d9880bceb9cd982187a07fe'
            '857eb46c32c12333a7110fb3ea99d2246084724856638f2e04324fc2a576626d')
