# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=pyviz_comms
pkgname=python-${_base}
pkgdesc="Bidirectional communication for the PyViz ecosystem"
pkgver=3.0.4
pkgrel=1
arch=(any)
url="https://github.com/pyviz/${_base}"
license=(BSD-3-Clause)
depends=(python-param jupyterlab)
makedepends=(python-build python-installer python-hatch-nodejs-version python-hatch-jupyter-builder python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('94fb3bae7fefb01f22ceea73636dc9c0423d62ba60dee4eaa34c72512c1b9fdf34e056e50862d12fa8748ba5b2d46b55ecd8378219941e8ac65dac169e888c80')

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
