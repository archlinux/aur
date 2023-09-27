# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Contributor: Bob Finch <w9ya@arrl.net>

pkgname=xfhell-gtk3
_pkgname=xfhell
pkgver=3.5.2
pkgrel=1
pkgdesc="Ham Radio - GTK3 app - de/en-codes Hellschreiber signals."
arch=('i686' 'x86_64')
url="http://www.qsl.net/5b4az/pkg/xfhell/xfhell.html"
license=(GPL3)
depends=('gtk3' 'alsa-lib' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'intltool' 'imagemagick' 'pkg-config')
options=('!emptydirs')
provides=(xfhell)
conflicts=(xfhell)
source=("http://www.qsl.net/5b4az/pkg/$_pkgname/$_pkgname-$pkgver.tar.bz2"
	$_pkgname.desktop
	$_pkgname.1)

build() {
	cd $srcdir/$_pkgname-$pkgver

	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd $srcdir/$_pkgname-$pkgver

	make check
}

package() {
	cd $srcdir/$_pkgname-$pkgver

	mkdir -p $pkgdir/usr/share/doc/$_pkgname/examples/
	mkdir -p $pkgdir/usr/share/{applications,pixmaps,man/man1}
	make DESTDIR=$pkgdir install

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$_pkgname $pkgdir/usr/bin/$_pkgname.1
	install -D -m 755 ../$_pkgname.1 $pkgdir/usr/bin/$_pkgname

	install -Dm644 $_pkgname/xfhellrc $pkgdir/usr/share/doc/$_pkgname/examples/xfhellrc.example

	rm $pkgdir/usr/share/doc/$_pkgname/$_pkgname.1.gz

	install -Dm755 ../$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
	install -Dm755 $_pkgname/$_pkgname.svg $pkgdir/usr/share/pixmaps/$_pkgname.svg
}
md5sums=('0a2ea20cc8fd6a2225ef09b9810818bb'
         '9a3568a6dbdd2bfb90aa76adf2dc531f'
         '4c8296c0475d78d5fd3de879c4742648')
sha256sums=('7b16ecdaa425ebc19f7e555fe28473e0228ea344e0203062a4e408346e75b209'
            'a4bdba7b601bace48e15bd2dc6f0daadd8a10511242cbb2fdc17bf78a19647b5'
            'f0beac04651d70dd27fe021894665967b1531a6f90e6402dee77b3005f63cd3e')
