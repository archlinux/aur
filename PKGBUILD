# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=python-pypinfo
pkgver=19.0.0
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
	'python-google-cloud-bigquery>=0.29.0'
	'python-tinydb>=4'
	'python-tinyrecord>=0.2.0')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pypinfo/pypinfo-$pkgver.tar.gz")
sha256sums=('d2e85268c5e8b21b092b929cd7812788496166835975e3fe49d16271d3fabf6a')

build() {
	cd "pypinfo-$pkgver"
	python setup.py build
}

package() {
	cd "pypinfo-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
