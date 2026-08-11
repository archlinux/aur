# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: kureta <kureta@gmail.com>
# Contributor: Renato Candido <renatocan@gmail.com>
_base=lesscpy
pkgname=python-${_base}
pkgver=0.15.2
pkgrel=1
pkgdesc="Python LESS compiler"
url="https://github.com/${_base}/${_base}"
depends=(python-ply python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
license=(MIT)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('1e78151917878b73c5c847b3aa246f14dbe0ac753e51252e209a9776e2e7f22359656f7ceed3eb669ea386ef98864b1b7b41804c79e850315b6c43dd0d15fd11')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
