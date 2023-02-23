# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aaron Coach <aur at ezpz dot cz>

pkgname=python-wakeonlan
_pkg="${pkgname#python-}"
pkgver=3.0.0
pkgrel=1
pkgdesc='Wake on LAN Python module'
url="https://github.com/remcohaszing/pywakeonlan"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/w/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('9a2a7cede51e2d4777330592190ea6e8ba391513d74e6f91d3197669cac7c754')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE.rst" "$pkgdir/usr/share/licenses/$pkgname/"
}
