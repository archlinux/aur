pkgbase=python-gast
pkgname=('python-gast' 'python2-gast')
pkgver=0.1.5
pkgrel=1
pkgdesc="AST that abstracts the underlying Python version "
url="https://github.com/serge-sans-paille/gast"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/g/gast/gast-${pkgver}.tar.gz")
md5sums=('41b0a32cd6872af9e09794f9ce382b47')

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

