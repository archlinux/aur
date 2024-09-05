# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer-gui
pkgname=${_base}
pkgdesc="A GUI tool for visualizing a preCICE configuration file as a dot file"
pkgver=0.2.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(GPL-3.0-or-later)
depends=(precice-config-visualizer xdot)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base/precice-/}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('577362ceae626a1e523bcec15ea105bc66e89382bf95143a14626deaf52fb06a7f7b939cd685786faea7758d8ac658bd8ab1474e2c8ccc786f686bcce8773338')

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
