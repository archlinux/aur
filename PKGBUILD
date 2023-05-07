# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-envisage
_name=${pkgname#python-}
pkgver=7.0.3
pkgrel=1
pkgdesc="Extensible Application Framework"
arch=(any)
url="https://github.com/enthought/envisage"
license=(BSD)
depends=(
  python-apptools
  python-configobj  # Optional dependency for python-apptools - required here
  python-scipy
  python-traitsui
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
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

  python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
