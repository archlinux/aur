# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=texttest
pkgver=4.2.3
pkgrel=2
pkgdesc="A tool for text-based functional testing"
arch=('any')
url="https://github.com/texttest/texttest"
license=('LGPL')
makedepends=(python-setuptools)
depends=(
  gtk3
  libblockdev
  python-boto
  python-certifi
  python-gobject
  python-matplotlib
  python-psutil
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('961d8aed65911426630b3fb9e45737065af5eba86467b2b267221c6eb003d4ea')

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
