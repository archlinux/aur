# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.0.9
pkgrel=1
pkgdesc="A tool for text-based functional testing"
arch=('any')
url="https://github.com/texttest/texttest"
license=('LGPL')
depends=('python' 'python-psutil' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2b830e1d425f87fc30d86d678bec098341d0e19aa42c98d6ce6cebcc1a74ce26')

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
