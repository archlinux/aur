# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-gff3
pkgver=1.0.0
pkgrel=1
pkgdesc="Manipulate genomic features and validate the syntax and reference sequence of GFF3 files"
arch=('any')
url='https://github.com/hotdogee/gff3-py'
license=('ISC')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d9a4791f5b5c5132672fb8ef7250622f1940026459b555035463b38652d32933')

build(){
	cd "gff3-py-$pkgver"
	python setup.py build

	cd docs
	make man BUILDDIR="$srcdir"
}

check() {
	cd "gff3-py-$pkgver"
	python setup.py test
}

package() {
	cd "gff3-py-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 "$srcdir/man/gff3.1" -t "$pkgdir/usr/share/man/man1/"
}
