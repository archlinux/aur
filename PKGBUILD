# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Arnaud Lier <zeprofdecoding@gmail.com>
_base=ghtopdep
pkgname=python-${_base}
pkgver=0.9.1
pkgrel=1
pkgdesc="CLI tool for sorting dependents repositories and packages by stars"
arch=(any)
url="https://github.com/github-tooling/${_base}"
license=(MIT)
depends=(python-selectolax
	python-tabulate
	python-click
	python-requests
	python-github3py
	python-appdirs
	python-pipdate
	python-cachecontrol
	python-tqdm)
makedepends=(python-build python-installer python-poetry)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('f1ce1bdcd1b805e9b4da064272d658de37e65cb2a42e63393b8bb58c3c7bfbe0879a5780f6ce169d5b1e78182eb30ec5d0a0d699790685e2b89bc6ffad7c0d6f')

build() {
	cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd ${_base}-${pkgver}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
