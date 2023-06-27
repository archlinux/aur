# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pdbp
pkgname=python-${_base}
pkgdesc="A drop-in replacement for pdb and pdbpp"
pkgver=1.4.1
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(MIT)
depends=(python-pygments python-tabcompleter)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e799d024aaaacd23f2e86b1aa458f5a68e5d1ba44d2f9315e4c6aa16b9efa02643157feb23c212b40c951882ad4dd6eb2ae12ea4d57e01974e1b87e559c841e6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
