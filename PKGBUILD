# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer
pkgname=${_base}-git
pkgdesc="A tool for visualizing a preCICE configuration file as a dot file"
pkgver=20231006
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(GPL3)
depends=(python-lxml python-pydot)
makedepends=(python-build python-installer python-setuptools python-wheel git)
source=(git+${url}.git#branch=master)
sha512sums=('SKIP')
provides=(${_base})
conflicts=(${_base})

pkgver() {
  cd ${_base/precice-/}
  git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
  cd ${_base/precice-/}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base/precice-/}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
