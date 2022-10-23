# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.2.1
pkgrel=1
pkgdesc="A tool for text-based functional testing"
arch=('any')
url="https://github.com/texttest/texttest"
license=('LGPL')
depends=('python' 'python-psutil' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f8255a812c77d9e96f61fa31fd9a145399ddf8b474df498a6db822503c4d3f25')

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
