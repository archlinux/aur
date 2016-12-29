pkgbase=python-gast
pkgname=('python-gast' 'python2-gast')
pkgver=0.1.3
pkgrel=1
pkgdesc="AST that abstracts the underlying Python version "
url="https://github.com/serge-sans-paille/gast"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/1a/87/7c3a76a8754fb602fe1d0c397978c55795c776b6d31a6e714002046190f8/gast-0.1.3.tar.gz")
md5sums=('5a4cd95a7890c0bd4b85a63e4b391935')

prepare() {
  cd "${srcdir}"/gast-$pkgver
}

build() {
  cp -r "${srcdir}"/gast-$pkgver "${srcdir}"/gast-$pkgver-py2

  cd "${srcdir}"/gast-$pkgver
  python setup.py build

  cd "${srcdir}"/gast-$pkgver-py2
  python2 setup.py build
}

package_python-gast() {
  depends=('python')

  cd "${srcdir}/gast-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-gast() {
  depends=('python2')

  cd "${srcdir}/gast-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

