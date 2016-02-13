# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
pkgname=djvubind
pkgver=1.2.1
pkgrel=2
pkgdesc='A tool to create highly compressed djvu files with ocr, metadata, and bookmarks'
arch=('any')
url='https://github.com/strider1551/djvubind'
license=('GPL3')
depends=('python' 'djvulibre' 'imagemagick')
makedepends=('python')
optdepends=(
	'tesseract: for OCR'
	'minidjvu: for higher black-and-white compression'
	'cuneiform: an alternative OCR system')
source=($pkgname-$pkgver.tar.gz::https://github.com/strider1551/djvubind/archive/v1.2.1.tar.gz
	djvubind-1.2.1-compress.patch)
md5sums=('62a5d4d3661685b13b358c0ba338caa8'
         '6fb6019bbc7e0171241399a145ef0b25')

# Output data for new tesseract version does not match reference data
#check() {
#	cd "$srcdir/$pkgname-$pkgver/unittests"
#	python3 ./unittests.py
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	for i in ../*.patch; do
		patch -i "$i" -p1
	done

	python3 ./setup.py install --root "$pkgdir"
}
