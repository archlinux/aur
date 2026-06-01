pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.9.0
pkgrel=1
arch=(any)
url="https://github.com/OHF-Voice/wyoming"
license=('MIT')
depends=(python)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-flask' 'python-swagger-ui-py' 'python-zeroconf')
optdepends=(
	'python-zeroconf: Zeroconf support'
	'python-flask: http'
	'python-swagger-ui-py: http'
)
source=("git+https://github.com/OHF-Voice/wyoming.git#tag=v${pkgver}")
b2sums=('34f7600f17730d66f8d98a8f607f2441de24b743ccd2d1377c03e3978b69e665e03ffe109ca4fb06f95908e033128308a6e5791134d3b1fae2f592153309d6eb')

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
