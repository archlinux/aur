# Maintainer: Luke Short <ekultails@gmail.com>
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=crudini
pkgver=0.9.6
pkgrel=2
pkgdesc="A utility for manipulating ini files"
arch=(any)
url="https://github.com/pixelb/crudini"
license=(GPL-2.0-only)
depends=(
  python
  python-iniparse
)
makedepends=(
  python-build
  python-iniparse
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('87dfa84373879cced9897b8605521a24cfd7d24c42db34eb05143b468f130444')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  cd tests
  ./test.sh
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
