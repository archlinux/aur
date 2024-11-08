# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pdbp
pkgname=python-${_base}
pkgdesc="A drop-in replacement for pdb and pdbpp"
pkgver=1.6.1
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(PSF-2.0)
depends=(python-pygments python-tabcompleter)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('643464c9ad05e5f4a9871fb53c423b0e8e8e0fe36fba50911d96a0050248b248c7d71d5d601d5e8d6eb6a202450ae4d3bd782780cf933824045317dc1f8c075c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
