# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lari Tikkanen <lartza@wippies.com>

pkgname=python-irc3
_pkg=irc3
pkgver=1.1.8
pkgrel=2
pkgdesc="Plugable irc client library based on asyncio"
arch=('any')
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python-venusian' 'python-setuptools')
optdepends=('python-docopt: for the irc3 command')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('8057be86e89b79a2358d4fae9b9c404350af136bd0ce11e232e7f1bee7c3b04b')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i '/setup_requires/d' setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
