# Maintainer: Patrick Armengol <patrickarmengol AT protonmail DOT com>

_name=hatch
pkgname=python-hatch-git
pkgver=1.9.1.r8.g7b1ef02a
pkgrel=1
pkgdesc="Modern, extensible Python project management"
arch=('any')
url="https://hatch.pypa.io/latest/"
license=('MIT')
groups=()
depends=(
  'python' 'python-click' 'python-hatchling' 'python-httpx' 'python-hyperlink'
  'python-keyring' 'python-packaging' 'python-pexpect' 'python-platformdirs'
  'python-rich' 'python-setuptools' 'python-shellingham' 'python-tomli' 'python-tomli-w' 'python-tomlkit'
  'python-userpath' 'python-virtualenv' 'python-zstandard'
)
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-hatch-vcs')
checkdepends=()
optdepends=()
provides=('python-hatch')
conflicts=('python-hatch')  # the python-hatch community package is missing a provides
replaces=()
backup=()
options=()
install=
changelog=
source=("hatch::git+https://github.com/pypa/hatch.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "hatch"
  git describe --long --tags --match "hatch-*" --candidates 100 | sed 's/^hatch-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hatch"
  python -m build --wheel --no-isolation
}

# tests are not found, issue #329 tracking
# check() {
#   cd "hatch/backend"
#   PYTHONPATH="$PWD/src" pytest
# }

package() {
  cd "hatch"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
