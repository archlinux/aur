_base=pyxmpp2
pkgname=python-${_base}-git
pkgver=2.0.1.r2.g59e5fd7
pkgrel=1
pkgdesc="The new and shiny XMPP implementation for Python"
arch=(any)
license=(LGPL)
url="https://github.com/Jajcus/${_base}"
depends=(python)
makedepends=(python-setuptools git)
optdepends=('python-dnspython: ')
source=(git+${url}.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  python setup.py
}

build() {
  cd ${_base}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
