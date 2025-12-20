pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.8.0
pkgrel=2
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
b2sums=('3e3a13224a13c350efb4fdf01fdef7ee5612af4fc6706e66d11477773d701141e509cf7883e949745c19a675844c9b8c3811f4b3ee688f5b4671d8ef26af02a6')

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
