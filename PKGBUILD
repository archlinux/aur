# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgbase=python-peakutils
pkgname=('python-peakutils' 'python2-peakutils')
pkgver=1.1.0
pkgrel=1
pkgdesc="Peak detection utilities for 1D data"
arch=('any')
url="https://pypi.python.org/pypi/PeakUtils"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/8c/65/3d2af06155ce028a7a3292c656c24d433d9226621c23d988725b8fdedfcc/PeakUtils-${pkgver}.tar.gz")
md5sums=('8135587ff696d109b87989f86a76f509')

prepare() {
  cd "${srcdir}"

  cp -a "PeakUtils-${pkgver}" "${pkgname[0]}"
  cp -a "PeakUtils-${pkgver}" "${pkgname[1]}"
}

build() {
  cd "${srcdir}/${pkgname[0]}"
  python setup.py build

  cd "${srcdir}/${pkgname[1]}"
  python2 setup.py build
}

package_python-peakutils() {
  depends=('python-numpy' 'python-scipy')

  cd "${srcdir}/${pkgname[0]}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-peakutils() {
  depends=('python2-numpy' 'python2-scipy')

  cd "${srcdir}/${pkgname[1]}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

