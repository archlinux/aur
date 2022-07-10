# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron Coach <aur at ezpz dot cz>

pkgname=python-wakeonlan
_pkg="${pkgname#python-}"
pkgver=2.1.0
pkgrel=2
pkgdesc='Wake on LAN Python module'
url="https://github.com/remcohaszing/pywakeonlan"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('c9deddcdf72256dd31f884b1c971c6d6af97730df2d33782cca8a9d3c28f2080')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
