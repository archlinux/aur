# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pinyin
pkgver=0.46.0
pkgrel=1
pkgdesc="Chinese to Pinyin library"
arch=('any')
url='https://github.com/mozillazg/python-pinyin'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pypinyin/pypinyin-$pkgver.tar.gz")
sha256sums=('0d2e41e95dbc20a232c0f5d3850654eebbfcba303d96358d2c46592725bb989c')

build() {
	cd "pypinyin-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "pypinyin-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
