# Maintainer: Jan Rydzewski <flegmer@gmail.com>

pkgname=morfeusz2-dictionary-sgjp
pkgver=20180204
pkgrel=1
pkgdesc="SGJP dictionary for Morfeusz morphological analyser"
arch=('any')
url='http://sgjp.pl/morfeusz/'
license=('BSD')

makedepends=('python2-morfeuszbuilder')

source=("LICENCE"
        "http://sgjp.pl/morfeusz/download/$pkgver/sgjp-$pkgver.tab.gz"
        "http://sgjp.pl/morfeusz/download/$pkgver/morfeusz-src-$pkgver.tar.gz")
sha256sums=("16c7ca379ef9fb6368c20d0ee71a9c83dd9c55e3b9fc34aade443c33d731d829"
            "a5d43904e42fc640fcb84ba785d6aa138792ad2f07db93af5ef658fe76f66c34"
            "663138c8a73f76b442582582f13a1946d4d70c6cb81a235e113126faa5365722")

function build {
	cd "$srcdir"
	morfeusz_builder \
		--input "sgjp-$pkgver.tab" \
		--tagset-file trunk/input/morfeusz-sgjp.tagset \
		--segments-file trunk/input/segmenty.dat \
		--dict sgjp
}

function package {
	cd "$srcdir"
	install -D -t "$pkgdir/usr/share/morfeusz/dictionaries/" \
		sgjp-a.dict \
		sgjp-s.dict
	install -D -t "$pkgdir/usr/share/licenses/$pkgname" \
		LICENCE
}
