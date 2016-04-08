# Maintainer: Simon Boulay <simon.boulay@alkeona.net>

pkgbase=python-breathe
pkgname=('python-breathe' 'python2-breathe')
pkgver=4.2.0
pkgrel=3
pkgdesc="An extension to reStructuredText and Sphinx to be able to read and render Doxygen xml output."
arch=('any')
url="https://breathe.readthedocs.org/en/latest/"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/b/breathe/breathe-${pkgver}.tar.gz")
md5sums=('e35f6ce54485663857129370047f6057')

prepare() {
  cp -a "breathe-$pkgver" "breathe2-$pkgver"
}

package_python-breathe() {
  depends=('python' 'python-setuptools')

  cd "breathe-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-breathe() {
  depends=('python2' 'python2-setuptools')

  cd "breathe2-$pkgver"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  # To avoid file conflict with the python3 version
  mv "$pkgdir/usr/bin/breathe-apidoc" "$pkgdir/usr/bin/breathe-apidoc2"
}
