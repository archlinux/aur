# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pdbp
pkgname=python-${_base}
pkgdesc="A drop-in replacement for pdb and pdbpp"
pkgver=1.5.0
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(MIT)
depends=(python-pygments python-tabcompleter)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f6b29e3623ced46ad68d008511ef64ee58bf2fadcb07fc20e1459ea52478fa44c3e45ce1a4d94bafd0657de9915c4a43084141388519b807f34a4b5155faef7a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
