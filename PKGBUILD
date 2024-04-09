# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pipxu
pkgver=1.9
pkgrel=1
pkgdesc="Install and Run Python Applications in Isolated Environments using UV"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.8" "python-filelock" "python-platformdirs" "uv")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('8c4f48f181d89b14cc873edbd248fa369895959d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
