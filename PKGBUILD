# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pinyin
pkgver=0.45.0
pkgrel=2
pkgdesc="Chinese to Pinyin library"
arch=('any')
url='https://github.com/mozillazg/python-pinyin'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pypinyin/pypinyin-$pkgver.tar.gz")
sha256sums=('776439244a20c7386425ceb37b5a69b36e1c469ca0550f4423c9900f44f5134b')

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
