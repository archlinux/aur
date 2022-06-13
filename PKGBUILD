# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-scandir
_name=${pkgname#python2-}
pkgver=1.10.0
pkgrel=5
pkgdesc='Better directory iterator and faster os.walk() alternative'
arch=('x86_64')
url='https://github.com/benhoyt/scandir'
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('73a773c58432ce28f32286f2892217101f4cf61ff4bccd8829ebaa7af7c56620')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  touch test/__init__.py
  rm -rf test/testdir
  LC_CTYPE=en_US.UTF-8 python2 -m unittest discover -v
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
