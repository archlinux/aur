# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-zipp
_name=${pkgname#python2-}
pkgver=1.2.0
pkgrel=2
pkgdesc='Backport of pathlib-compatible object wrapper for zip files'
arch=('any')
url='https://github.com/jaraco/zipp'
license=('MIT')
depends=('python2-contextlib2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2cbf5e1c894df2e16f41133abda23bed5aa464c6fef7362410e33ce47c9c2ff4')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Remove setuptools_scm dependency
  sed -i /scm/d setup.cfg
  sed -i s/use_scm_version=True//g setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
