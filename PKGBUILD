# Maintainer: Patrick Armengol <patrickarmengol AT protonmail DOT com>

_name=hatchling
pkgname=python-hatchling-git
pkgver=1.21.0.r17.g7b1ef02a
pkgrel=1
pkgdesc="Modern, extensible Python build backend"
arch=('any')
url="https://hatch.pypa.io/latest/"
license=('MIT')
groups=()
depends=('python-editables' 'python-packaging' 'python-pathspec' 'python-pluggy' 'python-trove-classifiers')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=('python-hatchling')
conflicts=('python-hatchling')  # the python-hatchling community package is missing a provides
replaces=()
backup=()
options=()
install=
changelog=
source=("hatch::git+https://github.com/pypa/hatch.git")  # just download the whole thing lmao
# source=("svn+$url/trunk/backend")  # depends on svn instead of git
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "hatch"
  git describe --long --tags --match "hatchling*" --candidates 100 | sed 's/^hatchling-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hatch/backend"
  python -m build --wheel --no-isolation
}

# tests are not found, issue #329 tracking
# check() {
#   cd "hatch/backend"
#   PYTHONPATH="$PWD/src" pytest
# }

package() {
  cd "hatch/backend"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
