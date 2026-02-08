# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-json-schema-to-pydantic
_gitpkgname=json-schema-to-pydantic
pkgver=0.4.9
pkgrel=1
pkgdesc='Automatically generate Pydantic v2 models from JSON Schema definitions'
arch=('any')
url='https://github.com/richard-gyiko/json-schema-to-pydantic'
license=('MIT')
depends=(
  'python'
  'python-pydantic'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-hatch-vcs'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/richard-gyiko/json-schema-to-pydantic/archive/v${pkgver}.tar.gz"
)

sha512sums=(
  '2dc2b175129d7cdbcc1d6a1da6e65ee4be0bdd16d1f1dfeb3e452089f1d2b39548e2fedead3b2c06af18baac1b705044797a410e5a2efd3e0ae9cf452d061fe1'
)

build() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  echo >&2 'Running unit tests'
  pytest
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    docs/* README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
