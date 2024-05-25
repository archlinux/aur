# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
_base=pyevtk
pkgname=python-${_base}
pkgver=1.6.0
pkgrel=1
pkgdesc="Export data as binary VTK files"
arch=(any)
url="https://github.com/pyscience-projects/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fb52a3270c9ea3e7a92380543592a8109099f99fcc29ed70bc5f0a4d9f750c1b5b602e2d4a6a27edac26e75e8091377a6ce4fa21a24cbc2dfebaa06ef6715f98')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
