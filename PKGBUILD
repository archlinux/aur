# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-pluggy
_name=${pkgname#python2-}
pkgver=0.13.1
pkgrel=10
pkgdesc='A minimalist production ready plugin system'
arch=('any')
url='https://github.com/pytest-dev/pluggy'
license=('MIT')
depends=('python2-importlib-metadata')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('25d8e53a6eee6939f13b79dc9053b3edd6f705e5a7ba042ae528a1b5fdd9615c')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Remove setuptools_scm dependency
  sed -i /scm/d setup.py
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
