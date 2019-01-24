# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=pharo
pkgver=7.0.1
pkgrel=1
pkgdesc="a fork of Squeak, an implementation of the object-oriented, dynamically typed, reflective programming language Smalltalk"
arch=(x86_64)
url="http://www.pharo-project.org/"
license=('MIT')
depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'nas' 'dbus' 'libxml2')

_imageversion="7.0.1-0-64bit-b882595"
_vmversion="201901231209-a4b2dfa"

source=(http://files.pharo.org/vm/pharo-spur64/linux/pharo-linux-x86_64threaded-${_vmversion}.zip \
	http://files.pharo.org/image/70/Pharo7.0.1-0.build.142.sha.b882595.arch.64bit.zip
	http://files.pharo.org/media/logo/icon-512x512.png\
	$pkgname.sh
	 $pkgname.desktop)

sha256sums=('2878087f97e8b62df89c514cc8b3aa35314e653dc3c64bcff33a3240393c1d2b'
            'a612e85bb0ea0f2016189d9a4fe0510f1d8008776eaf106362cdd0c3b96f963c'
            '5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'
            'bd07726f9ee4a503eedeaa576c0a3af10177724f446e1bf2569a55d3c5584412'
            'ad37a9c7d05b72a1d0375de7b7056dfcb220e2bef6358a99b6075ae6f66905f6')

package() {
	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/opt

	umask 002
	cd $srcdir
	mkdir -p $pkgdir/opt/pharo/shared

	cp -R bin $pkgdir/opt/pharo
	cp -R lib $pkgdir/opt/pharo
	install $pkgname.sh $pkgdir/opt/pharo/pharo
	install -m777 Pharo${_imageversion}.changes $pkgdir/opt/pharo/shared/Pharo7.0.changes
	install Pharo${_imageversion}.image $pkgdir/opt/pharo/shared/Pharo7.0.image
	install Pharo7.0-32bit-b882595.sources $pkgdir/opt/pharo/shared/
	install -m777 -d $pkgdir/opt/pharo/shared/pharo-local

	ln -s /opt/pharo/pharo $pkgdir/usr/bin/pharo

	install icon-512x512.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	chgrp -R users $pkgdir/opt/pharo/
}
