# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-thinc
_pkg="${pkgname#python-}"
pkgver=9.1.1
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
	'python-murmurhash'
	'python-numpy>=2.0'
	'python-packaging'
	'python-preshed'
	'python-pydantic'
	'python-srsly'
	'python-wasabi')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-cupy' 'python-pytorch' 'python-tensorflow')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('21fae2986d7777a6f050b9046dc9eab11852f1c9a997dcc9032f3ecc22784a4a')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
