# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Håvard Pettersson <mail@haavard.me>

pkgname=python-scrython
_pkg="${pkgname#python-}"
pkgver=1.11.0
pkgrel=1
pkgdesc='Python wrapper for the Scryfall API'
url='https://github.com/NandaScott/Scrython'
arch=('any')
license=('MIT')
depends=('python-aiohttp')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('4afcc631c56ae56e7433e1482e074a2b5acb9c7dd85ed98991760491fd6da83a')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
