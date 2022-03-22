# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-kgt
pkgver=0.4.4
pkgrel=1
pkgdesc="Python tools for keygen.sh licensing"
arch=('any')
url='https://pypi.org/project/kgt'
license=('custom:proprietary')
depends=(
	'python>=3.7'
	'python-appdirs'
	'python-cryptography'
	'python-pynacl'
	'python-requests'
	'python-rich'
	'python-tomli'
	'python-tomli-w'
	'python-x21')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/k/kgt/kgt-$pkgver.tar.gz")
sha256sums=('a3fdf8102389bfcbf97c543df7ff74c59dc11599897f72cdf31ddfe3d35466c8')

build() {
	cd "kgt-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "kgt-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
