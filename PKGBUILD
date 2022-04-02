# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-cachingutils
_name=cachingutils
pkgver=1.0.7
pkgrel=1
pkgdesc="Utilities to make caching data easier"
arch=('any')
url="https://github.com/vcokltfre/cachingutils"
license=('MIT')
depends=('python-lru-dict')
makedepends=('python-poetry' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a3229f9a600aed1666d45e1dd1bf09c64616dbe67db68df79a8abdf5bee1d3b5')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	export PYTHONHASHSEED=0
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
