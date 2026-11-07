pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.11.0
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
b2sums=('8a382631ae87dafe73aa4702e2aa769e64fffb13f7d7d4fb3b29d2ae3bc2bf7605db2b00b7c8e380368d43c125c156139d1307e5641bc91a3b533d1ca3185823')

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
