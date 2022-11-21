# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python38-ipykernel
pkgver=6.17.1
pkgrel=1
pkgdesc="The ipython kernel for Jupyter"
arch=('any')
url="https://pypi.org/project/ipykernel/"
license=('BSD')
depends=('python38-traitlets' 'python38-tornado' 'ipython' 'python38-jupyter_client' 'python38-debugpy' 'python38-psutil')
makedepends=('python38-build' 'python38-installer' 'python38-hatchling')
checkdepends=('python38-pytest-timeout' 'python38-flaky' 'python38-ipyparallel' 'python38-matplotlib')
source=("ipykernel-$pkgver.tgz::https://github.com/ipython/ipykernel/archive/v$pkgver.tar.gz")
sha256sums=('b9bacbae860a5c4c3fd1f64c473ccba737dcf9b8364e9198a08bf60f0b774fec')

# dep cycle with python38-jupyter_client

build() {
  cd ipykernel-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd ipykernel-$pkgver
  pytest -v
}

package() {
  cd ipykernel-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
