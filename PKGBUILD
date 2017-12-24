# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgbase=python-bitvector
pkgname=(python-bitvector python2-bitvector)
pkgver=3.4.7
pkgrel=1
pkgdesc="A memory-efficient packed representation for bit arrays in pure Python"
url="https://pypi.python.org/pypi/BitVector"
license=('PSF')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/B/BitVector/BitVector-$pkgver.tar.gz")
sha512sums=('5f9c9d13de6bec4b982a98564561b250152ba0ebdc119c75ddaf3822451dabe417d023fa529fd0ab8f583f86209369937b803d3ed0809ebeb312886504d96dfe')

prepare() {
  cp -a BitVector-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/BitVector-$pkgver
  python setup.py build

  cd "$srcdir"/BitVector-$pkgver-py2
  python2 setup.py build
}

package_python-bitvector() {
  depends=('python')

  cd BitVector-$pkgver
  python3 setup.py install --root="$pkgdir" --optimize=1
}

package_python2-bitvector() {
  depends=('python2')

  cd BitVector-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
