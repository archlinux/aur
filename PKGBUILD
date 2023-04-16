# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.3.0
pkgrel=1
pkgdesc="A tool for text-based functional testing"
arch=(any)
url="https://github.com/texttest/texttest"
license=(LGPL)
makedepends=(python-setuptools)
depends=(
  gtk3
  python-boto
  python-certifi
  python-gobject
  python-matplotlib
  python-psutil
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bc027b833cccf9043179accbb7e3fb876649c9eaffd25b62a00a1655c58ff320')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 texttestlib/doc/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
