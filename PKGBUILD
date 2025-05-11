# Maintainer: Marc Riera <marcriera@softcatala.org>
pkgname=apertium-apy
pkgver=0.13.0
pkgrel=1
pkgdesc="Apertium HTTP Server in Python"
arch=('any')
url="https://github.com/apertium/apertium-apy"
license=('GPL-3.0-only')
depends=('python>=3.9' 'python-tornado')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/apertium/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("23e68c869f9af8a47546d7726b586bea633abe18a2b145a23075c14ed3f96265")

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
