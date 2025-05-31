pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.6.1
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming"
license=('MIT')
depends=(python)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-asyncio')
optdepends=('python-zeroconf: Zeroconf support')
source=("git+https://github.com/rhasspy/wyoming.git#tag=${pkgver}")
b2sums=('8e1048152e9cb6211f85f0ddfb523f4e258a281cced2a8ec4d470e561a2ea840a207ff91904fb26abb9330cef6a5bf8e99c5b0973ef2cf30be2a0f97e7af7a9c')

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
