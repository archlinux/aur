# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=deepcomparer
pkgname=python-${_base}
pkgdesc="Deep compare python structures like dictionaries, lists and iterables"
pkgver=0.4.0
pkgrel=1
arch=(any)
url="https://github.com/jparadadev/${_base}.py"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('030d3396f809f31acbc707660461c83a17840de508d1aee01d27cdeefdde2c5fb2fccfac4130a43b2eabb44b78f76e420b9fa81f15335eb6e2cda0dcbc9189a9')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
