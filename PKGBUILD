# Maintainer: Mark Collins <tera_1225 hat hotmail.com>
pkgname=matrix-commander-git
_name="${pkgname%-git}"
pkgver=r398.362b419
pkgrel=1
pkgdesc="Simple CLI-based Matrix client (from git master)"
arch=('any')
url="https://github.com/8go/matrix-commander"
license=('GPL-3.0-or-later')
makedepends=(
  "git"
  "python-build"
  "python-installer"
  "python-wheel"
)
depends=(
  "bash"
  "python"
  "python-aiohttp"
  "python-async-timeout"
  "python-aiofiles"
  "python-emoji"
  "python-markdown"
  "python-matrix-nio" # AUR
  "python-pillow"
  "python-setuptools"
  "python-magic"
  "python-pyxdg"
  "python-atomicwrites"
  "python-cachetools"
  "python-olm"
  "python-peewee"
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

