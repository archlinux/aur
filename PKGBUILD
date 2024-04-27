# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_pkgname=pygalmesh
pkgname=python-pygalmesh
pkgdesc="A Python interface to CGAL's meshing tools"
pkgver=0.10.6
pkgrel=6
arch=(x86_64)
url="https://github.com/meshpro/pygalmesh"
license=(GPL-3.0-or-later)
depends=('python' 'python-numpy' 'python-meshio')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'pybind11' 'cgal' 'eigen')
checkdepends=('python-pytest' 'python-pytest-codeblocks' 'python-pytest-cov')
source=("$_pkgname-$pkgver::https://github.com/meshpro/pygalmesh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('298ae2434bac0881d630c9f7ed37a92a9e00baec04cf86e8acec54d1f7e6e722')

build() {
  cd "$_pkgname-$pkgver"
  python3 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
