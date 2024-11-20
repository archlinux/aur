# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pystand
pkgver=2.4
pkgrel=1
pkgdesc="Install Python Versions From The Python-Build-Standalone Project"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.8" "python-argcomplete" "python-packaging"
         "python-platformdirs" "python-pygithub" "python-zstandard")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('10b0964436045cc4af78ab4acb99ec4e7e4b1e8e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # Have to suppress error while this packaging error exists:
  # https://github.com/pypa/packaging-problems/issues/742
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation 2>/dev/null
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
