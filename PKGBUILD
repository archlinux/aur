# Contributor: Håvard Pettersson <mail@haavard.me>
_base=matplotlib_label_lines
pkgname=python-${_base//_/-}
pkgver=0.6.0
pkgrel=1
pkgdesc="Label lines in matplotlib"
url="https://github.com/cphyc/${_base//_/-}"
arch=(any)
license=(MIT)
depends=(python-matplotlib python-more-itertools)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('af16901de94daa31c13d64479ef948cb0392b09ac7bc133f407a04986b620958889855ea0cf363f652ef1a1d1fb1eac7e5a7364ca45c55521e22868c09b635c1')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
