# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
pkgname=matrix-commander
pkgver=7.6.0
pkgrel=4
pkgdesc="Simple CLI-based Matrix client"
arch=('any')
url="https://github.com/8go/matrix-commander"
license=('GPL')
makedepends=(
  python-build
  python-installer
  python-wheel)
depends=(
  "bash"
  # adapted from requirements.txt:
  "python>3.7"
  "python-aiohttp"
  "python-async-timeout" # used to be a dep of aiohttp and now no longer is...
  "python-aiofiles>=0.6.0"
  # "python-argparse" part of python since 3.2
  # "python-asyncio" part of python since 3.3
  # "python-datetime" part of standard python
  "python-emoji"
  "python-markdown"
  "python-matrix-nio>=0.14.1"
  "python-pillow"
  "python-setuptools"  # Flagged by namcap
  "python-magic"
  "python-pyxdg"
  # "python-uuid" part of standard python

  # other dependencies:
  "python-atomicwrites"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
  "python-cachetools"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
  "python-olm"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
  "python-peewee"  # optdepends of matrix-nio, but included because matrix-commander wants it for encryption
)
optdepends=(
  "python-notify2: needed for notifications on desktop systems"
)
provides=()
conflicts=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2586035bc59fed9dfdea057ed7e1bcf946287fdae230622f0f641d327ad2df24')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

