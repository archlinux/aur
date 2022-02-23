# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=precice-config-visualizer
pkgname=${_base}-git
pkgdesc="A tool for visualizing a preCICE configuration file as a dot file"
pkgver=20220131
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice-/}"
license=(GPL3)
depends=(python-lxml python-pydot)
makedepends=(python-setuptools git)
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
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base/precice-/}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
