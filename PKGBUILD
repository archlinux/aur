# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgbase=python-peakutils
pkgname=('python-peakutils' 'python2-peakutils')
pkgver=1.3.2
pkgrel=1
pkgdesc="Peak detection utilities for 1D data"
arch=('any')
url="https://pypi.python.org/pypi/PeakUtils"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/2a/e0/a45948450946a87dae44d936ea7646d862e1014753c496468a05f20e95c5/PeakUtils-${pkgver}.tar.gz")
md5sums=('26a5bc40efb65f9764e2dc16ae1a397e')
sha256sums=('2cf1f609132f0219e2fc9c7e221b62d1c82c9a502ec9a4c1195823423275c954')

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

