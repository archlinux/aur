pkgbase=python-commonmark
pkgname=('python-commonmark' 'python2-commonmark')
pkgver=0.5.5
pkgrel=1
pkgdesc="Python parser for the CommonMark Markdown spec"
url="https://pypi.python.org/pypi/CommonMark"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/rtfd/CommonMark-py/archive/${pkgver}.tar.gz")
md5sums=('a2dbf2dba32d5df7921cad8d542d4ca8')

build() {
  cp -r "${srcdir}"/CommonMark-py-$pkgver "${srcdir}"/CommonMark-py-$pkgver-py2

  cd "${srcdir}"/CommonMark-py-$pkgver
  python setup.py build

  cd "${srcdir}"/CommonMark-py-$pkgver-py2
  python2 setup.py build
}

package_python-commonmark() {
  depends=('python-docutils' 'python-future')

  cd "${srcdir}/CommonMark-py-$pkgver"
  python setup.py install --root="${pkgdir}"
  mv ${pkgdir}/usr/bin/cmark.py ${pkgdir}/usr/bin/cmark-py3.py
}

package_python2-commonmark() {
  depends=('python2-docutils' 'python2-future')

  cd "${srcdir}/CommonMark-py-$pkgver"
  python2 setup.py install --root="${pkgdir}"
  mv ${pkgdir}/usr/bin/cmark.py ${pkgdir}/usr/bin/cmark-py2.py
}


