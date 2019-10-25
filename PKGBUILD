# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgbase=python-pysendfile
pkgname=(python-pysendfile python2-pysendfile)
pkgver=2.0.1
pkgrel=2
pkgdesc="A Python interface to sendfile(2) syscall"
url="https://github.com/giampaolo/pysendfile"
license=('MIT')
arch=('x86_64')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/p/pysendfile/pysendfile-$pkgver.tar.gz")
sha512sums=('d6ee08eb251fac30c90a9ee829fd992f3620697eef2893ced5a2c6273486c3c5fd35c70962585a8d747d578817391f91c929bfeeba8c4485d52a15748229ca9c')

prepare() {
  cp -a pysendfile-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/pysendfile-$pkgver
  python setup.py build

  cd "$srcdir"/pysendfile-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/pysendfile-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.8" python test/test_sendfile.py

  cd "$srcdir"/pysendfile-$pkgver-py2
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-2.7" python2 test/test_sendfile.py
}

package_python-pysendfile() {
  depends=('python')

  cd pysendfile-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-pysendfile() {
  depends=('python2')

  cd pysendfile-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
