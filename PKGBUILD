# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Duscheleit <jinks@archlinux.us>
pkgname=python2-colorama
_name="${pkgname#python2-}"
pkgver=0.4.5
pkgrel=1
pkgdesc='Simple cross-platform colored terminal text in Python'
arch=('any')
url='https://github.com/tartley/colorama'
license=('BSD')
depends=('python2')
checkdepends=('python2-mock')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b6fcb66accc1ef6106b564ca39f616f065f35c9d07bc1c04d2c219b381f5a557')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m unittest discover -p *_test.py
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
