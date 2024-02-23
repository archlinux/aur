# Maintainer: Dennis Herbrich <dennis.herbrich@veloxis.de>
pkgname=openapi-python-client
pkgver=0.18.0
pkgrel=1
pkgdesc='Generate modern Python clients from OpenAPI 3.0 and 3.1 documents'
arch=('any')
url='https://github.com/openapi-generators/openapi-python-client'
license=('MIT')
depends=(
  'python>=3.8'
  'python-jinja>=3.0.0'
  'python-typer>0.6'
  'python-shellingham>=1.3.2'
  'python-pydantic>=2.1.1'
  'python-attrs>=21.3.0'
  'python-dateutil>=2.8.1'
  'python-httpx>=0.20.0'
  'python-yaml>=6.0'
  'python-typing_extensions>=4.8.0'
  )
makedepends=(
  'python-pdm'
  'python-hatchling'
  'python-build'
  'python-installer'
  'python-wheel'
  )
optdepends=(
  'python-pdm: use generated PDM metadata'
  'python-poetry: use generated Poetry metadata'
  'python-setuptools: use generated setuptools metadata'
  'python-ruff>=0.2: linter support in generated code'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openapi-generators/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c2cbbed1f713f6f9086d53957947fda3fa79f4587ff741acb20c653413ab5a2c')

build() {
  cd "${pkgname}-${pkgver}"
  pdm build --no-sdist --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# NOTE: check() with `pdm run test` deliberately not included. Too much of a
# hassle to get running properly, and checkdepends on a handful of (orphaned)
# AUR packages as well. Not worth the effort, IMHO.
