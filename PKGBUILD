# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgbase=python-nptdms
pkgname=('python-nptdms' 'python2-nptdms')
pkgver=0.8.0
pkgrel=1
pkgdesc="Cross-platform, NumPy based module for reading TDMS files produced by LabView."
arch=('any')
url="https://pypi.python.org/pypi/npTDMS"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/9a/7f/f938fe134adc27681386e16e6be73ae93a0d65b9bdf2c6351361d7b153bc/npTDMS-${pkgver}.tar.gz")
md5sums=('9611226890a6e1abdacf2aabd136c65a')

prepare() {
  cd "${srcdir}"

  cp -a "npTDMS-${pkgver}" "${pkgname[0]}"
  cp -a "npTDMS-${pkgver}" "${pkgname[1]}"
}

build() {
  cd "${srcdir}/${pkgname[0]}"
  python setup.py build

  cd "${srcdir}/${pkgname[1]}"
  python2 setup.py build
}

package_python-nptdms() {
  depends=('python-numpy')

  cd "${srcdir}/${pkgname[0]}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-nptdms() {
  depends=('python2-numpy')

  cd "${srcdir}/${pkgname[1]}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

