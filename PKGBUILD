# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
_pkg="${pkgname#python-}"
pkgver=8.2.1
pkgrel=1
pkgdesc='Practical Machine Learning for NLP'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/thinc'
license=('MIT')
depends=(
	'python-blis'
	'python-catalogue'
	'python-confection'
	'python-cymem'
	'python-mock'
	'python-murmurhash'
	'python-numpy'
	'python-packaging'
	'python-preshed'
	'python-pydantic'
	'python-srsly'
	'python-wasabi')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('cd7fdb3d883a15e6906254e7fb0162f69878e9ccdd1f8519db6ffbfe46bf6f49')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
