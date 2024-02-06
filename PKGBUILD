# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=srsly
pkgname=python-${_pkgname}
pkgver=2.4.8
pkgrel=3
pkgdesc='Modern high-performance serialization utilities for Python'
arch=(x86_64 aarch64)
url='https://github.com/explosion/srsly'
license=(MIT)
depends=(
	cython0
	python-catalogue
	python-pytest
	python-pytest-timeout
	python-pytz
	python-mock
	python-numpy
)
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/refs/tags/v${pkgver}.tar.gz)
b2sums=('f4f028118cc437fd84e4ed45e0c0279032c9be21b8fba9836df37c19f78572d23920bcaefed42e5d77ab68b38589bcb16c9a834d43b9cd5fbbe6702c32b5f6ff')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
