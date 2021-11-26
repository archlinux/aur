# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-pypinfo
pkgver=20.0.0
pkgrel=1
pkgdesc="View PyPI download statistics with ease"
arch=('any')
url="https://github.com/ofek/pypinfo"
license=('MIT')
depends=(
	'python>=3.6'
	'python-appdirs'
	'python-binary'
	'python-click'
	'python-google-cloud-bigquery'
	'python-tinydb'
	'python-tinyrecord')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pypinfo/pypinfo-$pkgver.tar.gz")
sha256sums=('770bbafda03eb231929ef6e245bf75c09b260bbd5fcdf54a8cc446aa2b2d2d0e')

build() {
	cd "pypinfo-$pkgver"
	python setup.py build
}

package() {
	cd "pypinfo-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
