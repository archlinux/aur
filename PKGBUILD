# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=python-pysendfile
pkgver=2.0.1
pkgrel=9
pkgdesc="A Python interface to sendfile(2) syscall"
url="https://github.com/giampaolo/pysendfile"
license=('MIT')
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/p/pysendfile/pysendfile-$pkgver.tar.gz")
sha512sums=('d6ee08eb251fac30c90a9ee829fd992f3620697eef2893ced5a2c6273486c3c5fd35c70962585a8d747d578817391f91c929bfeeba8c4485d52a15748229ca9c')

build() {
  cd pysendfile-$pkgver
  python setup.py build
}

check() {
  cd pysendfile-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-311" python test/test_sendfile.py
}

package() {
  cd pysendfile-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
