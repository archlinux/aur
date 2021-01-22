# Contributor: Simon Bachmann <simonbachmann@freesurf.ch>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=mirrormagic-bin
_pkgname=mirrormagic
pkgver=3.0.0
pkgrel=1
pkgdesc="Arcade style game like Deflektor (C64) or Mindbender (Amiga)."
arch=('i686' 'x86_64')
url="http://www.artsoft.org/mirrormagic/"
license=('GPL2')
depends=('sdl_image' 'sdl_mixer')
provides=('mirrormagic')
replaces=('mirrormagic')

source=("http://www.artsoft.org/RELEASES/unix/mirrormagic/$_pkgname-$pkgver.tar.gz"
        "$_pkgname.sh"
        "mirrormagic.desktop")

md5sums=('2670a44a98c4095a8360995ada533c64'
         '7ba2849d0c79415dabc3068ca9d7b5ba'
         '64ebdbe659a2fd5efd3979350cf9bbec')

package() {
	cd "$_pkgname-$pkgver"

	# copy main files
	install -dm755 "$pkgdir/usr/share/$_pkgname"
	cp -r * "$pkgdir/usr/share/$_pkgname"

	install -D -m755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

	# install desktop entry file
	install -D -m644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	# fix permissions
	cd "$pkgdir/usr/share/$_pkgname/"
	find . -type f -exec chmod 644 {} \;
	chmod 755 $_pkgname
}

# vim:set ts=2 sw=2 et:
