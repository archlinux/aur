pkgbase=python-commonmark
pkgname=('python-commonmark' 'python2-commonmark')
pkgver=0.7.3
pkgrel=1
pkgdesc="Python parser for the CommonMark Markdown spec"
url="https://pypi.python.org/pypi/CommonMark"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/rtfd/CommonMark-py/releases/download/${pkgver}/CommonMark-${pkgver}.tar.gz")
#source=("https://github.com/rolandshoemaker/CommonMark-py/archive/v${pkgver}.tar.gz")
md5sums=('b1085af871ca782bccb0ccbd5af31ebc')

build() {
  cp -r "${srcdir}"/CommonMark-$pkgver "${srcdir}"/CommonMark-py2-$pkgver

  cd "${srcdir}"/CommonMark-$pkgver
  python setup.py build

  cd "${srcdir}"/CommonMark-py2-$pkgver
  python2 setup.py build
}

package_python-commonmark() {
  depends=('python-docutils' 'python-future')

  cd "${srcdir}/CommonMark-$pkgver"
  python setup.py install --root="${pkgdir}"
  mv ${pkgdir}/usr/bin/cmark ${pkgdir}/usr/bin/cmark-py3
}

package_python2-commonmark() {
  depends=('python2-docutils' 'python2-future')

  cd "${srcdir}/CommonMark-py2-$pkgver"
  python2 setup.py install --root="${pkgdir}"
  mv ${pkgdir}/usr/bin/cmark ${pkgdir}/usr/bin/cmark-py2
}


