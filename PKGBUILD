# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pipxu
pkgver=1.17
pkgrel=1
pkgdesc="Install and Run Python Applications in Isolated Environments using UV"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.8" "python-filelock" "python-platformdirs"
         "python-argcomplete" "uv>=0.1.33")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('50e03542f32b95f4dcae437e7ad8432ae2df99b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
