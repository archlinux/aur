# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Sapin <simon dot sapin at exyr dot org>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgbase=python-tinycss
pkgname=(python-tinycss python2-tinycss)
pkgver=0.3
pkgrel=1
pkgdesc="A complete yet simple CSS parser for Python"
url="https://pypi.python.org/pypi/tinycss"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2')
checkdepends=('python-pytest' 'python2-pytest')
source=("http://pypi.python.org/packages/source/t/tinycss/tinycss-$pkgver.tar.gz")
md5sums=('13999e54453d4fbc9d1539f4b95d235e')

prepare() {
  cp -a tinycss-$pkgver{,-py2}
}

build() {
  cd "$srcdir/tinycss-$pkgver"
  python setup.py build

  cd "$srcdir/tinycss-$pkgver-py2"
  python2 setup.py build
}

check() {
  cd "$srcdir/tinycss-$pkgver"
  py.test build

  cd "$srcdir/tinycss-$pkgver-py2"
  py.test2 build
}

package_python-tinycss() {
  depends=('python')

  cd "$srcdir/tinycss-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-tinycss() {
  depends=('python2')

  cd "$srcdir/tinycss-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
