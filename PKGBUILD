# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-filelock
pkgver=3.2.1
pkgrel=2
pkgdesc='A platform independent file lock'
url='https://github.com/benediktschmitt/py-filelock'
_name=${url##*/}
license=('custom:Unlicense')
arch=('any')
depends=('python2')
makedepends=('python2-setuptools-scm')
checkdepends=('python2-pytest' 'python2-pytest-cov' 'python2-pytest-timeout')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('888bbcb7eb839f40947867a21eddf96ffcbc7e70bdcb3b18fbed115dbf6c8a6e')

build() {
  cd "$srcdir/$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  PYTHONPATH=src python2 -m pytest
}

package() {
  cd "$srcdir/$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
