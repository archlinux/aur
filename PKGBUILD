# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.1.0
pkgrel=1
pkgdesc="A tool for text-based functional testing"
arch=('any')
url="https://github.com/texttest/texttest"
license=('LGPL')
depends=('python' 'python-psutil' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4e6eb9045363b296a318efc2e40e27480731aa3c75648c3b476c84259be4a52c')

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
