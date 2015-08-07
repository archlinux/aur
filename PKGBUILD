# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>

_name="chemview"
pkgbase="python-${_name}-git"
pkgname=("python-${_name}-git" "python2-${_name}-git")
pkgver=0.3.r87.c7e9150
pkgrel=1
pkgdesc="An interactive molecular viewer for the IPython notebook (git version)"
arch=("any")
url="http://chemview.readthedocs.org/en/latest"
license=("LGPL2.1")
depends=("python" "python-numpy" "python-numba" "ipython-notebook"
         "python2" "python2-numpy" "python2-numba" "ipython2-notebook")
makedepends=("git")
source=("git+https://github.com/gabrielelanaro/${_name}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  _parent_ver=$(git log --tags --simplify-by-decoration --pretty="format:%d" | head -n 1 | cut -d " " -f 6 | tr -d "v,")
  printf "%s.r%s.%s" \
         "${_parent_ver}" \
         "$(git rev-list --count HEAD)" \
         "$(git rev-parse --short HEAD)"
}

build_python-chemview-git() {
  cd "${srcdir}/${_name}"
  python setup.py build
}

build_python2-chemview-git() {
  cd "${srcdir}/${_name}"
  python2 setup.py build
}

package_python-chemview-git() {
  provides=("python-${_name}")
  conflicts=("python-${_name}")
  cd "${srcdir}/${_name}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-chemview-git() {
  provides=("python2-${_name}")
  conflicts=("python2-${_name}")
  cd "${srcdir}/${_name}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
