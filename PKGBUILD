# Maintainer: Patrick Armengol <patrickarmengol AT protonmail DOT com>

_name=hatchling
pkgname=python-hatchling-git
pkgver=v1.11.1.r43.g15a583af
pkgrel=1
pkgdesc="Modern, extensible Python build backend"
arch=('any')
url="https://github.com/pypa/hatch"
license=('MIT')
groups=()
depends=('python-editables' 'python-packaging' 'python-pathspec' 'python-pluggy' 'python-tomli')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
optdepends=()
provides=('python-hatchling')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("hatch::git+$url.git")  # just download the whole thing lmao
# source=("svn+$url/trunk/backend")  # depends on svn instead of git
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "hatch"
  git describe --long --tags --match "hatchling*" --candidates 100 | sed 's/^hatchling-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hatch/backend"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "hatch/backend"
#   PYTHONPATH="$PWD/src" pytest
# }

package() {
  cd "hatch/backend"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
