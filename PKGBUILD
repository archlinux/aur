# Contributor: Simon Bachmann <simonbachmann@freesurf.ch>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=mirrormagic-bin
_pkgname=mirrormagic
pkgver=3.3.1
pkgrel=1
pkgdesc="Arcade style game like Deflektor (C64) or Mindbender (Amiga)."
arch=('i686' 'x86_64')
url="http://www.artsoft.org/mirrormagic/"
license=('GPL2')
depends=('sdl_image' 'sdl_mixer')
provides=('mirrormagic')
replaces=('mirrormagic')

source=("https://www.artsoft.org/RELEASES/linux/mirrormagic/mirrormagic-${pkgver}-linux.tar.gz"
        "$_pkgname.sh"  "mirrormagic.desktop")

md5sums=('7e8d22bac6054dffda1350f69c0ed409'
         '7ba2849d0c79415dabc3068ca9d7b5ba'
         '5d5c26554f5434a099e3c1b17d621c2b')

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
