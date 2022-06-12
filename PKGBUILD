# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-zipp
_name=${pkgname#python2-}
pkgver=1.2.0
pkgrel=1
pkgdesc='Backport of pathlib-compatible object wrapper for zip files'
arch=('any')
url='https://github.com/jaraco/zipp'
license=('MIT')
depends=('python2-contextlib2')
makedepends=('python2-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2cbf5e1c894df2e16f41133abda23bed5aa464c6fef7362410e33ce47c9c2ff4')

build() {
  cd "$srcdir/$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
