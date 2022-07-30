# Contributor: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name=chemview
pkgname=python-${_name}-git
pkgver=0.7.r10.g2c9768d
pkgrel=1
pkgdesc="An interactive molecular viewer for the IPython notebook (git version)"
arch=(any)
url="https://github.com/gabrielelanaro/${_name}"
license=("LGPL2.1")
depends=(python-numba python-matplotlib jupyter-notebook python-ipywidgets)
makedepends=(git npm)
source=(git+${url})
sha512sums=('SKIP')
provides=(python-${_name})
conflicts=(python-${_name})

pkgver() {
  cd ${_name}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_name}
  python setup.py build
}

package() {
  cd ${_name}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
