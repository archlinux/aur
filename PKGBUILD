# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_name=hstspreload
pkgname=python-$_name
pkgver=2025.1.1
pkgrel=2
pkgdesc="Chromium HSTS Preload list as a Python package"
arch=(any)
url="https://github.com/sethmlarson/hstspreload"
license=(BSD-3-Clause)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
)
#checkdepends=(python-pytest python-urllib3)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
b2sums=('73c2170f96e7223148c914c06a3c19bdb12d73376b15787338a39fe9a4439bf82408056afdeb167c00f9ad0676e40e5be5f3f6ed685ab6b2c00d388aeba6c653')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

# This runs around 230k tests, checking to see if the online list matches the current one.
# It can take 5 minutes just to collect the tests. They're not distributed in the PyPI tarball.
#check() {
#  cd "${srcdir}"/${_pkg}-${pkgver}
#
#  python -m pytest
#}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
