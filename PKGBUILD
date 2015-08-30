# Maintainer: Tomi Belan <tomi.belan at gmail dot com>

# This package contains music and sounds from blobwars 1.17 (slightly modified to work with the
# binary in blobwars 1.19).
#
# The backstory: Version 1.17 is the last version made by the game's original authors (Parallel
# Realities). They just used music and sounds found on the Internet -- their origin and licensing
# status is uncertain. Later, maintainers from Fedora or Debian (I'm not sure) replaced the music
# and sounds with Creative Commons-licensed alternatives. The new sounds and music are free, but I
# think they aren't as good as the old version. So if you want to play blobwars as it was originally
# created (and you don't mind using potentially non-free data), replace blobwars-data with this
# package.
#
# See e.g. <https://bugs.launchpad.net/ubuntu/+source/blobwars/+bug/561182>
#
# blobwars-1.17-1.tar.gz is no longer available from the original upstream at
# <http://www.parallelrealities.co.uk/download/blobwars/blobwars-1.17-1.tar.gz>.
# But other sites confirm that 0541c4f6e4b9ca7222dc66594c054db8219e3e5f is the correct sha1sum:
# <http://pardus.linux.org.tr/changeset/104/corporate2/stable/game/arcade/blobwars/pspec.xml>
# <http://marc.info/?l=macports-changes&m=126994032819183>

pkgname=blobwars-data-old
_pkgname=blobwars
pkgver=1.17
pkgrel=2
pkgdesc="Platform action game featuring a blob wih lot of weapons - nonfree data files from an older version"
arch=('any')
url="http://www.parallelrealities.co.uk/p/blob-wars-metal-blob-solid.html"
license=('unknown')
provides=('blobwars-data=1.19')
conflicts=('blobwars-data')
source=(
	"https://web.archive.org/web/20150802111409/https://distfiles.macports.org/blobwars/blobwars-1.17-1.tar.gz"
	black.png
)
sha256sums=('dabcab073de8b49a89440046ce28fc776bf73475d9f8ee5a33251d9ba5c42bce'
            '5e95f7b352df0de37b8e5b08a32a15311dc83c15ef3ec6a89fbb7b0afb774b3f')
sha1sums=('0541c4f6e4b9ca7222dc66594c054db8219e3e5f'
          '42e2ae5c2cf890164aba3638399e20996d463241')

package() {
	cd "$srcdir/${_pkgname}-$pkgver"

	datadir=$pkgdir/usr/share/games/blobwars
	mkdir -p "$datadir"
	cp -pr data gfx sound music "$datadir"

	cd "$datadir/gfx/main"
	cp "$srcdir/black.png" cc-by.png
	cp "$srcdir/black.png" cc-by-sa.png
	cp "$srcdir/black.png" book.png
	cp "$srcdir/black.png" sequel.png

	cd "$datadir/sound"
	for f in *.wav; do
		ln -s "$f" "${f%.wav}"
	done

	cd "$datadir/music"
	ln -s friendDied.mod gameover
	ln -s daisyChain2.mod cutscene
	ln -s sweetDreams.xm end
	ln -s commando.xm grasslands
	ln -s forAFriend.mod hub
	ln -s helmet-shake.mod title
	ln -s autumnsDawning.s3m credits
}
