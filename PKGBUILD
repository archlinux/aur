# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Alex Zose <alexander[dot]zosimidis[at]gmail[dot]com>

pkgname=crudini
pkgver=0.9.5
pkgrel=1
pkgdesc="A utility for manipulating ini files"
arch=(any)
url="https://github.com/pixelb/crudini"
license=(GPL2)
depends=(
  python
  python-iniparse
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b0492cb9ce126ce3c05ae7d8424c0fca5b26a788f593afe000150ba0c4b23cdb')

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

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
}
