# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgbase=python-bitvector
pkgname=(python-bitvector python2-bitvector)
pkgver=3.4.8
pkgrel=2
pkgdesc="A memory-efficient packed representation for bit arrays in pure Python"
url="https://pypi.python.org/pypi/BitVector"
license=('PSF')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/B/BitVector/BitVector-$pkgver.tar.gz")
sha512sums=('22d76c33d407b7ff2b0493ed4949189d7fc9ea8fd7497610014ede5f27756b5f91678a5f2da5db5e04f9e85e98378001d0edb5a8c2e3053083d18e547799f3f1')

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
