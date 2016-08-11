pkgbase=python-recommonmark
pkgname=('python-recommonmark' 'python2-recommonmark')
pkgver=0.4.0
pkgrel=1
pkgdesc="A markdown parser for docutils"
url="https://github.com/rtfd/recommonmark"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-commonmark' 'python2-commonmark')
source=("https://pypi.python.org/packages/source/r/recommonmark/recommonmark-${pkgver}.tar.gz")
md5sums=('f8e9d96ab19922652c4e35d73155967e')

build() {
  cp -r "${srcdir}"/recommonmark-$pkgver "${srcdir}"/recommonmark-$pkgver-py2

  cd "${srcdir}"/recommonmark-$pkgver
  python setup.py build

  cd "${srcdir}"/recommonmark-$pkgver-py2
  python2 setup.py build
}

package_python-recommonmark() {
  depends=('python-docutils' 'python-commonmark')

  cd "${srcdir}/recommonmark-$pkgver"
  python setup.py install --root="${pkgdir}"
}

package_python2-recommonmark() {
  depends=('python2-docutils' 'python2-commonmark')

  cd "${srcdir}/recommonmark-$pkgver"
  python2 setup.py install --root="${pkgdir}"
  mv "${pkgdir}"/usr/bin/cm2html "${pkgdir}"/usr/bin/cm2html2
  mv "${pkgdir}"/usr/bin/cm2latex "${pkgdir}"/usr/bin/cm2latex2
  mv "${pkgdir}"/usr/bin/cm2man "${pkgdir}"/usr/bin/cm2man2
  mv "${pkgdir}"/usr/bin/cm2pseudoxml "${pkgdir}"/usr/bin/cm2pseudoxml2
  mv "${pkgdir}"/usr/bin/cm2xetex "${pkgdir}"/usr/bin/cm2xetex2
  mv "${pkgdir}"/usr/bin/cm2xml "${pkgdir}"/usr/bin/cm2xml2

}


