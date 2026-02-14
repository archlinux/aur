# Maintainer: LY <ly-niko@qq.com>

pkgname=python-pydocket
_name=pydocket
pkgver=0.17.7
pkgrel=1
pkgdesc="A distributed background task system for Python functions"
arch=('any')
url="https://github.com/chrisguidry/docket"
license=('MIT')
depends=(
  'python>=3.10'
  'python-cloudpickle'
  'python-cachetools'
  'python-croniter'
  'python-fakeredis'
  'python-opentelemetry-api'
  'python-prometheus_client'
  'python-py-key-value-aio'
  'python-json-logger'
  'python-redis'
  'python-rich'
  'python-typer'
  'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/cd/b2/5e12dbe2acf59e4499285e8eee66e8e81b6ba2f553696d2f4ccca0a7978c/${_name}-${pkgver}.tar.gz")
sha256sums=('5c77ec6731a167cdcb44174abf793fe63e7b6c1c1c8a799cc6ec7502b361ee77')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
