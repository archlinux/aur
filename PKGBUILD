# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_pkgname=ipydatagrid
pkgname=python-${_pkgname}-git
pkgver=1.1.13.r37.gf8742cb
pkgrel=1
pkgdesc="Fast Datagrid widget for the Jupyter Notebook and JupyterLab"
arch=('any')
url="https://github.com/bloomberg/ipydatagrid"
license=('BSD')
depends=(python python-bqplot python-py2vega python-numpy python-pandas python-ipywidgets python-traitlets)
conflicts=(python-ipydatagrid)
provides=(python-ipydatagrid)
checkdepends=()
optdepends=()
makedepends=(git python-hatchling python-hatch-jupyter-builder python-installer yarn)
source=("${_pkgname}::git+https://github.com/bloomberg/ipydatagrid")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${_pkgname}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package(){
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:ts=2:sw=2:et:
