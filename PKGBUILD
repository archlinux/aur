# Maintainer: Alvaro F. García <https://rainbyte.github.io>
# Contributor: Daniel Milde <daniel at milde dot cz>
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=pharo-bin
_pkgname=pharo
pkgver=8.0
pkgrel=1
pkgdesc="A fork of Squeak, an implementation of the object-oriented, dynamically typed, reflective programming language Smalltalk"
arch=(x86_64)
url="https://pharo.org/"
license=('MIT')
depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'dbus' 'libxml2')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=('https://files.pharo.org/get-files/80/pharo64-linux-stable.zip'
        'http://files.pharo.org/media/logo/icon-512x512.png'
        "$_pkgname.sh"
	"$_pkgname.desktop")

sha256sums=('533e786c5676ed293df8fac648a38cfb54aaa1c03d40d70036313a7c0f2a6038'
            '5a6f40722264a2befc9aea1dace399f2491cd45a98987458660f8a39d4e6887e'
            'b160f1303f79255148c11c5625644cd42e5aea6e51de19ef4858c925e31baff0'
            '68b96be66d14a9ad129016b2b59fc73a25ca92091a5869e9ae8960470b19f273')

package() {
	# copy executables and libs
	install -d "$pkgdir/opt/$_pkgname"
	cp -R $srcdir/bin $pkgdir/opt/$_pkgname
	cp -R $srcdir/lib $pkgdir/opt/$_pkgname

	# make symlinks
	install -Dm755 $srcdir/$_pkgname.sh $pkgdir/usr/bin/$_pkgname

	# copy icons
	install -Dm644 $srcdir/icon-512x512.png $pkgdir/usr/share/pixmaps/$pkgname.png

	# copy .desktop files
	install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
