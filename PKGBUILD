# Maintainer: Jakub Klinkovský <lahwaacz@archlinux.org>

_pkgname=pygalmesh
pkgname=python-pygalmesh
pkgdesc="A Python interface to CGAL's meshing tools"
pkgver=0.10.6
pkgrel=2
arch=('x86_64')
url="https://github.com/nschloe/pygalmesh"
license=('GPL3')
depends=('python' 'python-numpy' 'python-meshio')
makedepends=('python-build' 'python-install' 'python-setuptools' 'python-wheel' 'pybind11' 'cgal-headers' 'eigen')
checkdepends=('python-pytest' 'python-pytest-codeblocks' 'python-pytest-cov')
source=("$_pkgname-$pkgver::https://github.com/nschloe/pygalmesh/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3e936cfa8007f97f7a87c6a54c588ee7cac7fd0fd2a9d02aecfe8867949e0698')

build() {
  cd "$_pkgname-$pkgver"
  python3 -m build --wheel --skip-dependency-check --no-isolation
}

# FIXME tests fail due to https://github.com/nschloe/pygalmesh/issues/180
#check() {
#  cd "$_pkgname-$pkgver"
#  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#  PYTHONPATH="$PWD/build/lib.linux-$CARCH-${python_version}" pytest
#}

package() {
  cd "$_pkgname-$pkgver"
  python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
