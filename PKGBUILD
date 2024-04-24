# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pipxu
pkgver=1.14
pkgrel=1
pkgdesc="Install and Run Python Applications in Isolated Environments using UV"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.8" "python-filelock" "python-platformdirs"
         "python-argcomplete" "uv")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('5894f4f5f3f66f178d50e579b48187576f13e6ed')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
