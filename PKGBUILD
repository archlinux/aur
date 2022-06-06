# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.1.2
pkgrel=1
pkgdesc="A tool for text-based functional testing"
arch=('any')
url="https://github.com/texttest/texttest"
license=('LGPL')
depends=('python' 'python-psutil' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('68e555d2496abb3af3bd844074b104e43c1dbf62a8f9b5ee8d28a6cb51c705c4')

build() {
  cd "$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 texttestlib/doc/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
