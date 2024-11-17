pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.6.0
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming"
license=('MIT')
depends=(python)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=('python-zeroconf: Zeroconf support')
source=("git+https://github.com/rhasspy/wyoming.git#tag=${pkgver}")
b2sums=('9448b555ee0e0443700f799a324c2048682188930778cac3296ba1452b61455fb76616b0c4275680b6afe08e2e32c6db3ff86cf89144a7959128588b00e72079')

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
