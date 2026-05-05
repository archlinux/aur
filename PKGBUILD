# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pystand
pkgver=2.33
pkgrel=1
pkgdesc="Install Python Versions From The Python-Build-Standalone Project"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.14" "python-packaging"
         "python-argparse-from-file" "python-platformdirs" "python-pygithub"
         "python-certifi" "python-filelock")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('ac202dedc4a2a83eb3460da0afaa2363ded29237')

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
