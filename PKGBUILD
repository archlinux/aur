# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=datatypes
pkgname=python-${_base}
pkgver=0.19.0
pkgrel=1
pkgdesc="Utility Classes and Functions that are handy across multiple projects"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('8b480df66cc81b6c9e20fe0fd13cc35d76a16f53dde6e2b4c3fee35af44c466d09be62a12128a2148c98584f75a7d755fa52a8b1c9f5b7ad8e22f583784da2aa')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
