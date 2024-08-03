# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Arnaud Lier <zeprofdecoding@gmail.com>
_base=ghtopdep
pkgname=python-${_base}
pkgver=0.4.3
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
sha512sums=('7ba803be9dbaf8897180c762349e1550339518872ac62863dab332dce9661eaa366ff152c6084370d52946614b42a61072b098f4c391a78013f588c78f55fd95')

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
