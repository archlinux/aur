pkgbase=python-commonmark
pkgname=('python-commonmark' 'python2-commonmark')
pkgver=0.6.3
pkgrel=1
pkgdesc="Python parser for the CommonMark Markdown spec"
url="http://commonmark.org/"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/f7/94/b6a4965cfcabc17802dd31709d57f13d7d1dc50c6a42b3e9766fe634996f/CommonMark-${pkgver}.tar.gz")
md5sums=('a75f584af26d3978b33a296a77f8354e')

build() {
  cp -r "${srcdir}"/CommonMark-$pkgver "${srcdir}"/CommonMark-$pkgver-py2

  cd "${srcdir}"/CommonMark-$pkgver
  python setup.py build

  cd "${srcdir}"/CommonMark-$pkgver-py2
  python2 setup.py build
}

package_python-commonmark() {
  depends=('python-docutils' 'python-future')

  cd "${srcdir}/CommonMark-$pkgver"
  python setup.py install --root="${pkgdir}"
  mv ${pkgdir}/usr/bin/cmark.py ${pkgdir}/usr/bin/cmark-py3.py
}

package_python2-commonmark() {
  depends=('python2-docutils' 'python2-future')

  cd "${srcdir}/CommonMark-$pkgver"
  python2 setup.py install --root="${pkgdir}"
  mv ${pkgdir}/usr/bin/cmark.py ${pkgdir}/usr/bin/cmark-py2.py
}


