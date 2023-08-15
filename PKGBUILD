# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=poethepoet
pkgname=python-${_base}
pkgdesc="A task runner that works well with poetry"
pkgver=0.22.0
pkgrel=1
arch=(any)
url="https://github.com/nat-n/${_base}"
license=(MIT)
depends=(python-pastel python-tomli python-poetry)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-v.${pkgver}.tar.gz::${url}/archive/v.${pkgver}.tar.gz)
sha512sums=('a2bddaac8c2ef8f0b34729d5a509991baa8a550ef27f335d82c1a487ae93cbd95a13cb6e14aed79cad5a4d7eafcb03fb18a592f3665ce82444145f8bd5c70551')

build() {
  cd ${_base}-v.${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-v.${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
