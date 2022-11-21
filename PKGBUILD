# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-jupyter_client
pkgver=7.4.7
pkgrel=1
pkgdesc="Jupyter protocol implementation and client libraries"
arch=('any')
url="https://pypi.python.org/pypi/jupyter_client"
license=('BSD')
depends=('python38-ipykernel' 'python38-traitlets' 'python38-pyzmq'
         'python38-jupyter_core' 'python38-dateutil' 'python38-entrypoints' 'python38-nest-asyncio')
makedepends=('python38-build' 'python38-installer' 'python38-hatchling')
checkdepends=('python38-pytest' 'python38-async_generator' 'python38-pytest-asyncio' 'python38-pytest-timeout')
#source=("$pkgname-$pkgver.tgz::https://github.com/jupyter/jupyter_client/archive/$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/j/jupyter_client/jupyter_client-$pkgver.tar.gz")
sha256sums=('330f6b627e0b4bf2f54a3a0dd9e4a22d2b649c8518168afedce2c96a1ceb2860')

# dep cycle with python38-ipykernel

build() {
  cd jupyter_client-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd jupyter_client-$pkgver
  pytest -vv
}

package() {
  cd jupyter_client-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
