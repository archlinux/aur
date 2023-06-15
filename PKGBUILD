# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jerry73204 <jerry73204 at google gmail>
_base=pyviz_comms
pkgname=python-${_base}
pkgdesc="Bidirectional communication for the PyViz ecosystem"
pkgver=2.3.2
pkgrel=1
arch=(any)
url="https://github.com/pyviz/${_base}"
license=('custom:BSD-3-clause')
depends=(python-param jupyterlab)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('17c6c9888924142330258f46311ec148a55c0b6b6487cc85f0425dd902f2dc0ec08fae0ad9cf36c90f8c36bc7d4d680c860334670a5d4a4194c553c75b8e0fdc')

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
