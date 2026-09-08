# Maintainer: LY <ly-niko@qq.com>

pkgname=python-pydocket
_name=pydocket
pkgver=0.25.0
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
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/31/04/aed51c2d53341d5651e17f7b853534b70021474109e595824c665681b148/${_name}-${pkgver}.tar.gz")
sha256sums=('cf4b42cbb49276a0791470944b1518a342258f0d852c9e65c2e17e344b8418ed')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
