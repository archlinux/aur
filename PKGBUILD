# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pdbp
pkgname=python-${_base}
pkgdesc="A drop-in replacement for pdb and pdbpp"
pkgver=1.8.0
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(PSF-2.0)
depends=(python-pygments python-tabcompleter)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('82bdbb5a54e9c4ba6f151e3f04320c9f5f3727ea9533f0da45f8d4904724b166aaf39a1af2fc8f7ffde1308e7737b635759e837356f288513ef4be93909dbfb3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
