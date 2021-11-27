# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-gff3
pkgver=1.0.1
pkgrel=1
pkgdesc="Manipulate genomic features and validate the syntax and reference sequence of GFF3 files"
arch=('any')
url='https://github.com/hotdogee/gff3-py'
license=('ISC')
depends=('python')
makedepends=('python-setuptools' 'python-sphinx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b9547543df39250200c56e3ea336651e72233c4eb8b71295ac51dbe3b2c020d7')

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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$srcdir/man/gff3.1" -t "$pkgdir/usr/share/man/man1/"
}
