# Maintainer: gilcu3 < gilcu3 at gmail dot com >
# Previous Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-inquirer
_pkg="${pkgname#python-}"
pkgver=3.4.0
pkgrel=1
pkgdesc="Collection of common interactive command line user interfaces, based on Inquirer.js"
arch=('any')
url='https://github.com/magmax/python-inquirer'
license=('MIT')
depends=('python-blessed' 'python-editor' 'python-readchar')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('8edc99c076386ee2d2204e5e3653c2488244e82cb197b2d498b3c1b5ffb25d0b')

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
