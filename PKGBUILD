# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-envisage
_name=${pkgname#python-}
pkgver=7.0.3
pkgrel=3
pkgdesc="Extensible Application Framework"
arch=(any)
url="https://github.com/enthought/envisage"
license=(BSD-3-Clause)
depends=(
  python
  python-apptools
  python-numpy
  python-pyface
  python-scipy
  python-setuptools
  python-traits
  python-traitsui
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  python-configobj
  python-pytest
  qt5-svg
)
optdepends=('ipython: for IPython shell plugin')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d7cb25abad84a3c7718671ae07c362e87cc8f1f4f4db417c1bbf3f8b855e3dac')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
