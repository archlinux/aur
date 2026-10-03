# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_name=measured
pkgname=python-${_name}
pkgver=0.12.2
pkgrel=1
pkgdesc="A library for measurements and quantities"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url="https://github.com/chrisguidry/measured"

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
depends=(
  'python>=3.10'
  'python-rich'
  'python-regex'
  'python-pydantic'
  'python-pydantic-core'
  'python-typer'
  'python-typing_extensions'
  'python-hypothesis'
)

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('1ab53b7f884c38f31eb22ff90c3dc7f11d333c745a4ba4be9947f1e520a1b2c8')

build() {
	cd "${_name}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
