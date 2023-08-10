# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pdbp
pkgname=python-${_base}
pkgdesc="A drop-in replacement for pdb and pdbpp"
pkgver=1.4.4
pkgrel=1
arch=(any)
url="https://github.com/mdmintz/${_base}"
license=(MIT)
depends=(python-pygments python-tabcompleter)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('87ce138db0a19a2c568b0d994abcd107c526988de2a6660c5edcb644353c7e0df4e69e55b6866699eb665ced412fa8bfb58b4a18d4456d0c6d7206a51733b53d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
