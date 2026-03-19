# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-json-schema-to-pydantic
_gitpkgname=json-schema-to-pydantic
pkgver=0.4.11
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

sha512sums=('020d0b29cc5340513f41cd354be68c74b478ca8cac4c4a43cc5622f44b64204b0f47888f8bbc3797c274f8508c746e82a36a87565a55b30668c59beff4bc8f38')

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
