# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pystand
pkgver=2.18
pkgrel=1
pkgdesc="Install Python Versions From The Python-Build-Standalone Project"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.8" "python-argcomplete" "python-packaging" "python-argparse-from-file"
         "python-platformdirs" "python-pygithub" "python-zstandard" "python-certifi")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('915b1f5fa5bb94eaf6e8c9daa7e51910496d9cf5')

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
