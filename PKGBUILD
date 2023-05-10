# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=sqlacodegen
_name=sqlacodegen
pkgver=3.0.0rc2
pkgrel=2
pkgdesc='Automatic model code generator for SQLAlchemy'
arch=(any)
url='https://github.com/agronholm/sqlacodegen'
license=(MIT)
depends=(
  python-inflect
  python-sqlalchemy
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/agronholm/sqlacodegen/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('90fb2da3f7ebffadb51798e1121e714e8239b949700e295ca9ce6a6b61503b356af0ae39002c59a2ab073eeaec42cba877752b5249ec19601421419602aeb2f7')

build() {
  cd "${_name}-${pkgver}"
  SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
