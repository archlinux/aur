# Maintainer: Simon Boulay <simon.boulay@alkeona.net>

pkgbase=python-breathe
pkgname=('python-breathe' 'python2-breathe')
pkgver=4.7.3
pkgrel=1
pkgdesc="An extension to reStructuredText and Sphinx to be able to read and render Doxygen xml output."
arch=('any')
url="https://breathe.readthedocs.org/en/latest/"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')
source=("breathe-v${pkgver}.tar.gz::https://github.com/michaeljones/breathe/archive/v${pkgver}.tar.gz")
sha256sums=('4ff9e0ddc9896c591758679cd4af567ac5d3598adbf93d70c08e3820eb994a20')

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
