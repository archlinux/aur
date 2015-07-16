# Maintainer: lucy <lucy@luz.lu>

pkgname=toilet-fonts
pkgver=1.0
pkgrel=2
pkgdesc="Additional asciiart fonts for toilet (adapted from figlet-fonts)"
arch=('any')
license=('GPL')
url="http://www.figlet.org/fontdb.cgi"
depends=(toilet)
optdepends=('jave: create cool ascii-art and figlets')
source=('ftp://ftp.figlet.org/pub/figlet/fonts/ours.tar.gz'
        'ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz'
        'ftp://ftp.figlet.org/pub/figlet/fonts/international.tar.gz'
		'ftp://ftp.figlet.org/pub/figlet/fonts/ms-dos.tar.gz')
sha256sums=('10184c883faa63e91c8c7d99f100fe2f76195221ff8863d29c1beef88f666e69'
            '2c569e052e638b28e4205023ae717f7b07e05695b728e4c80f4ce700354b18c8'
            'e6493f51c96f8671c29ab879a533c50b31ade681acfb59e50bae6b765e70c65a'
            'd3678a98b3b058ae4ded8525f51a1c53b3c6e6833793cf7cf98fcd9550ed7e70')

package() {
	install -d -m755 "$pkgdir/usr/share/figlet/"
	find "$srcdir" -iname '*.flf' |
	while IFS='' read target; do
		dest="$pkgdir/usr/share/figlet/$(basename "$target")"
		if [[ ! -e "$dest" ]]; then
			install -T -m644 "$target" "$dest"
		fi
	done
}
