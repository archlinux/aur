# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Arnaud Lier <zeprofdecoding@gmail.com>
_base=ghtopdep
pkgname=python-${_base}
pkgver=0.4.2
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
sha512sums=('3fb0e4a9467d5c8b86bfeb4e10c6f2300bbf137ae2ef0e21118b0f45d8f7a4e89c8fc94307e1c3ebd0e134fbf8c968ef1fee426b0a8528a6fa1e86c5fbb73dd8')

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
