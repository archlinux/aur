# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=declxml
pkgname=python-${_base}-git
pkgver=1.1.3.r5.g8cc2ff2
pkgrel=1
pkgdesc="Declarative XML processing library"
arch=(any)
url="https://github.com/gatkin/${_base}"
license=(MIT)
provides=("python-${_base}")
conflicts=("python-${_base}")
depends=(python)
makedepends=(python-setuptools)
source=(git+${url})
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd ${pkgdir}
  rm usr/py.typed
}
