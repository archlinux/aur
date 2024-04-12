# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer-gui
pkgname=${_base}
pkgdesc="A GUI tool for visualizing a preCICE configuration file as a dot file"
pkgver=0.1.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(GPL-3.0-or-later)
depends=(precice-config-visualizer xdot)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base/precice-/}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('932f54755e8b3cecc3c9dafd867d6eb8088c1fce9c2478ff12669d9b2da7c2f91ee137751fbf18fe1528ee382e7171cedb80a9809f3587cbfafee4f7095af17c')

build() {
  cd ${_base/precice-/}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/precice-/}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
