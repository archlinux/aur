# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=python-gffutils
pkgver=0.10.1
pkgrel=1
pkgdesc="GFF and GTF file manipulation and interconversion in Python"
arch=('any')
url="https://github.com/daler/gffutils"
license=('MIT')
depends=(
	'python-argcomplete'
	'python-argh'
	'python-pyfaidx'
	'python-simplejson'
	'python-six')
optdepends=(
	'bedtools: for genomic interval arithemtic'
	'python-biopython: for sequence manipulation'
	'python-pybedtools: wrapper for bedtools')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-setup.py.patch')
sha256sums=('c020f38d572a38227d575ca6b4a6781e10317c4231c7008f533bb6d9167f64d8'
            '8b8b8e89a6cf1cd74f73f5e5a67053a24bcc681182bc20c30716818fe9243c58')

prepare() {
	patch -p1 -d "gffutils-$pkgver" < 001-setup.py.patch
	sed -i "s/@PKGVER@/$pkgver/" "gffutils-$pkgver/setup.py"
}

build(){
	cd "gffutils-$pkgver"
	python setup.py build
}

package() {
	cd "gffutils-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
