# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=datatypes
pkgname=python-${_base}
pkgver=0.20.0
pkgrel=1
pkgdesc="Utility Classes and Functions that are handy across multiple projects"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6088f9724464bc0e1633f607923a8706e58c305b9be50a28d77580cdb13d399ea22081c74cc63eb9cd7c203c1b7e048992e675abdd7c4c0c86462a36ffc5474a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
