# Maintainer: Tomi Belan <tomi.belan at gmail dot com>

pkgname=blobwars-data-old
_pkgname=blobwars
pkgver=1.17
pkgrel=1
pkgdesc="Platform action game featuring a blob wih lot of weapons - nonfree data files from an older version"
arch=('any')
url="http://www.parallelrealities.co.uk/p/blob-wars-metal-blob-solid.html"
license=('unknown')
provides=('blobwars-data=1.19')
conflicts=('blobwars-data')
source=(
	"https://distfiles.macports.org/${_pkgname}/${_pkgname}-$pkgver-1.tar.gz"   # no longer available from the original upstream
	black.png
)
sha256sums=('dabcab073de8b49a89440046ce28fc776bf73475d9f8ee5a33251d9ba5c42bce'
            '5e95f7b352df0de37b8e5b08a32a15311dc83c15ef3ec6a89fbb7b0afb774b3f')

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
