# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=djvubind
pkgver=1.2.1
pkgrel=1
pkgdesc='A tool to create highly compressed djvu files with ocr, metadata, and bookmarks'
arch=('any')
url='http://code.google.com/p/djvubind/'
license=('GPL3')
depends=('python' 'djvulibre' 'imagemagick' 'tesseract')
makedepends=('python')
optdepends=('minidjvu: for higher black-and-white compression'
	'cuneiform: an alternative OCR system')
source=(http://djvubind.googlecode.com/files/$pkgname-$pkgver.tar.bz2
	djvubind-1.2.1-compress.patch)
md5sums=('027ee90fec7d6ee5ee921eebfae1dc2d'
         '6fb6019bbc7e0171241399a145ef0b25')

check() {
	cd "$srcdir/$pkgname-$pkgver/unittests"
	python3 ./unittests.py
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	for i in ../*.patch; do
		patch -i "$i" -p1
	done

	python3 ./setup.py install --root "$pkgdir"
}
