# Maintainer: LY <ly-niko@qq.com>

_name=pydocket
pkgname=python-${_name}
pkgver=0.25.2
pkgrel=1
pkgdesc="A distributed background task system for Python functions"
arch=('any')
url="https://github.com/chrisguidry/docket"
license=('MIT')
depends=(
  'python>=3.10'
  'python-cloudpickle'
  'python-cronsim'
  'python-burner-redis'
  'python-opentelemetry-api'
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
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/b7/7b/275197f8b2856d55e25d88986d864dc2df6d1e37bf5eca583dd1f88e7800/${_name}-${pkgver}.tar.gz")
sha256sums=('1f6297883f9f615c65aacc622e07233137f491154251e3a8c8ec3cefb52ac7d0')

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
