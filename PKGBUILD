# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pixelmatch
pkgname=python-${_base}
pkgdesc="A pixel-level image comparison library"
pkgver=0.3.0
pkgrel=1
arch=(any)
url="https://github.com/whtsky/${_base}-py"
license=('custom')
depends=(python)
makedepends=(python-build python-installer python-poetry-core python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('8d5f9ba9dc727900292edb8ad0787c1ba1e5b50099275265fa40979cf571d441f5fd70995214049e5fa3eb5ce6680c58e889c6fb650922b8420c01dc630c8354')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
