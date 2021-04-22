# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.0.7
pkgrel=2
pkgdesc="A tool for text-based functional testing"
arch=('any')
url="https://github.com/texttest/texttest"
license=('LGPL')
depends=('python' 'python-psutil' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('30bcde058d12f16458bb8c615e445a5fd11bc0645d072913d7aed094e9f11833ff04b5e8daceb6dde2515c0df8adba47fe2588105fde650a7d178dfabb9bc0af')

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
