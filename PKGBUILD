# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=wish-edict
pkgver=20230702
pkgrel=1
pkgdesc='Japanese-English dictionaries EDICT2 and KANJIDIC for Wish'
license=('Creative Commons BY-SA')
url='http://www.edrdg.org/jmdict/edict.html'

arch=('any')
depends=('wish')

source=('http://ftp.edrdg.org/pub/Nihongo/kanjidic.gz'
        'http://ftp.edrdg.org/pub/Nihongo/edict2.gz')
sha256sums=(SKIP SKIP)

pkgver() {
	date +%Y%m%d
}

build() {
	cd "$srcdir"
	rm -rf db
	wdic --database db --load --kanjidic kanjidic --edict edict2
}

package() {
	cd "$srcdir"
	install -dm755 "$pkgdir/usr/share/wish/db"
	install -m644 db/* "$pkgdir/usr/share/wish/db"
}
