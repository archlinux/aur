# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at tuta dot io>
_base=cpass
pkgname=cpass-py
pkgver=0.9.3
pkgrel=1
pkgdesc="An urwid based TUI frontend for pass"
arch=('any')
url="https://github.com/oliverlew/${_base}"
license=(MIT)
depends=(pass python-urwid)
makedepends=(python-build python-installer python-setuptools python-wheel)
provides=("${_base}")
conflicts=("${_base}")
install=${_base}.install
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha256sums=('75e139de3eaa0f87ea5fcc70a6c0b0521291700bc059d1edd1251e66c372cc34')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
