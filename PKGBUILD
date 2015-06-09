# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=pharo
pkgver=4.0
pkgrel=2
pkgdesc="a fork of Squeak, an implementation of the object-oriented, dynamically typed, reflective programming language Smalltalk"
arch=(i686 x86_64)
url="http://www.pharo-project.org/"
license=('MIT')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-alsa-lib' 'lib32-libvorbis' 'lib32-pango' 'lib32-mesa' 'nas' 'lib32-dbus-core' 'lib32-libxml2')
else
	depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'nas' 'dbus-core' 'libxml2')
fi

source=(http://files.pharo.org/platform/Pharo${pkgver}-linux.zip $pkgname.desktop)

md5sums=('b8cc96d9963b66f1d1486f47794db87a'\
		'1447999d37a6d87ddddc2f99d9781bbc')

package() {
	cd $srcdir/pharo${pkgver}/
	mkdir -p $pkgdir/opt/pharo
	mkdir -p $pkgdir/usr/bin

	cp -fr $srcdir/pharo${pkgver}/* $pkgdir/opt/pharo
	chgrp -R users $pkgdir/opt/pharo/
	chmod -R 755 $pkgdir/opt/pharo

	ln -s /opt/pharo/pharo $pkgdir/usr/bin/pharo

	#desktop icons
	mkdir -p $pkgdir/usr/share/pixmaps
	mkdir -p $pkgdir/usr/share/applications

	cp $srcdir/pharo${pkgver}/icons/Pharo.png $pkgdir/usr/share/pixmaps/$pkgname.png

	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
