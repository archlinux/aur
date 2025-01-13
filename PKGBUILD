# Maintainer: envolution
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Ronuk Raval <ronuk.raval at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-dialite
pkgver=0.6.0
pkgrel=1
pkgdesc='Lightweight pure-Python package to show simple dialogs'
arch=('any')
url='https://github.com/flexxui/dialite'
license=('BSD-2-Clause')
depends=('python')
makedepends=(
  'python-flit-core'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sphinx'
  'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2689c9da2f561899261dffebda21742bf7e7aeb2bf8a89536a81731afa15d11a')

build() {
  cd "dialite-$pkgver"
  python -m build --wheel --no-isolation
  make -C docs man
}

check() {
  cd "dialite-$pkgver"
  PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
  cd "dialite-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 docs/_build/man/Dialite.1 "$pkgdir/usr/share/man/man1/dialite.1"
}

# vim:set ts=2 sw=2 et:
