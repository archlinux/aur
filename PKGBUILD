# Maintainer: birdflesh <antkoul at gmail dot com>

pkgname=hunspell-el
pkgver=0.9
pkgrel=1
pkgdesc="Greek hunspell dictionary"
arch=(any)
url="http://elspell.math.upatras.gr"
license=('MPL' 'GPL' 'LGPL')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("$url/files/ooffice/el_GR-$pkgver.zip")
md5sums=('5b1ff7b3bc8203488b7d6f21fa875743')

package() {
	install -dm755 "$pkgdir/usr/share/hunspell"
	install -m644 el_GR.aff "$pkgdir/usr/share/hunspell"
	install -m644 el_GR.dic "$pkgdir/usr/share/hunspell"

	# the symlinks
	install -dm755 "$pkgdir/usr/share/myspell/dicts"
	pushd "$pkgdir/usr/share/myspell/dicts"
	for file in "$pkgdir/usr/share/hunspell/"*; do
		ln -sv /usr/share/hunspell/$(basename $file) .
	done
	popd

	# docs
	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	install -m644 README_el_GR.txt "$pkgdir/usr/share/doc/$pkgname"
}

