# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=discretize
pkgname=python-${_base}
pkgdesc="Discretization tools for finite volume and inverse problems"
pkgver=0.11.0
pkgrel=1
arch=(any)
url="https://github.com/simpeg/${_base}"
license=(MIT)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel meson-python cython)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c8a2e5aa3236e6df4040b9505be318020da0b6681e178d0a7280ec06e3180e743b97706543b668e4d27ff72e000d92be79c3d8b824356b17fe61fcd3d9df7b27')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
