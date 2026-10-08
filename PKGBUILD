# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Maintainer: LY <ly-niko@qq.com>

_name=pydocket
pkgname=python-${_name}
pkgver=0.26.2
pkgrel=1
pkgdesc="A distributed background task system for Python functions"

_pypi_package=${pkgname##python-}
_pypi_version=${pkgver}

arch=('any')
license=('MIT')
url="https://github.com/chrisguidry/docket"

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
depends=(
  'python>=3.10'
  'python-cloudpickle'
  'python-cronsim'
  'python-burner-redis'
  'python-opentelemetry-api'
  'python-opentelemetry-sdk'
  'python-prometheus_client'
  'python-py-key-value-aio'
  'python-json-logger'
  'python-redis'
  'python-rich'
  'python-typer'
  'python-typing_extensions'
  'python-uncalled-for'
  'python-exceptiongroup'
)

source=("https://files.pythonhosted.org/packages/source/${_pypi_package::1}/${_pypi_package//-/_}/${_pypi_package//-/_}-${_pypi_version}.tar.gz")
sha256sums=('7809eee323d413f23ec227a8eae2d0c7da802730e3c89a81c923aeae71212c26')

build() {
	cd "${_name}-${pkgver}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${_name}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
