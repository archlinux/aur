# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pipxu
pkgver=1.32
pkgrel=1
pkgdesc="Install and Run Python Applications in Isolated Environments using UV"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.8" "python-filelock" "python-platformdirs"
         "python-argcomplete" "python-packaging" "python-argparse-from-file" "uv>=0.1.33")
makedepends=("python-setuptools" "python-build" "python-installer"
             "python-wheel" "python-setuptools-scm")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('4bc695a0f54d4650f7f6e760ea679357b24263f5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
