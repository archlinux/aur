pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.10.2
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
b2sums=('462db93e731ba6ca5c34c5bf7c7a8cc75cf09a061730aacf13b4dc71ea4a0c0b0b1a41c5a0b93657d5e809b45e3e3fd66577090d19b8853f53afd81194c05e87')

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
