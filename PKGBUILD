# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
_base=pyrtlsdr
pkgname=python-${_base}-git
pkgver=r377.64835e7
pkgrel=1
pkgdesc="A Python wrapper for librtlsdr (a driver for Realtek RTL2832U based SDR's)"
arch=('any')
url="https://github.com/roger-/${_base}"
license=('GPL3')
depends=(python rtl-sdr)
makedepends=(git python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_base}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
