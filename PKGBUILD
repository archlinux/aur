# Maintainer: Cryolitia <cryolitia at gmail dot com>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:	Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-pinyin
_pkg=pypinyin
pkgver=0.54.0
pkgrel=1
pkgdesc="Chinese to Pinyin library"
arch=('any')
url='https://github.com/mozillazg/python-pinyin'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9ab0d07ff51d191529e22134a60e109d0526d80b7a80afa73da4c89521610958')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
