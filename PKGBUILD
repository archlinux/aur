# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Maziar Saleh Ziabari
# Contributor: Phil Schaf <flying-sheep@web.de>
pkgname=jupyter_latex_envs
pkgver=1.4.6
pkgrel=3
pkgdesc="Jupyter notebook extension which supports (some) LaTeX environments within markdown cells"
arch=(any)
url="https://github.com/jfbercher/${pkgname}"
license=(BSD-3-Clause)
depends=(jupyter-notebook)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('66c13b9c5f467ed86c49fc267d8f073849aa4e97ee931cf32fdbf37489a4610db0d8d715552fe7668eb1a97ffe1e0160724e7eb5f4c0a1ad4d60922b4f416ac5')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  # local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # chmod 644 "${pkgdir}${_site_packages}/latex_envs/static/envsLatex.js"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
