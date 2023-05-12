# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
pkgname=matrix-commander-git
_name="${pkgname%-git}"
pkgver=r324.dbf2829
pkgrel=2
pkgdesc="Simple CLI-based Matrix client (from git master)"
arch=('any')
url="https://github.com/8go/matrix-commander"
license=('GPL')
makedepends=(
  "python-build"
  "python-installer"
  "python-wheel"
)
depends=(
  # adapted from requirements.txt:
  "python>3.7"
  "python-aiohttp"
  "python-aiofiles>=0.6.0"
  # "python-argparse" part of python since 3.2
  # "python-asyncio" part of python since 3.3
  # "python-datetime" part of standard python
  "python-emoji"
  "python-markdown"
  "python-matrix-nio>=0.14.1"
  "python-pillow"
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
provides=("matrix-commander")
conflicts=("matrix-commander")
source=("${_name}::git+https://github.com/8go/matrix-commander.git")
md5sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_name"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

