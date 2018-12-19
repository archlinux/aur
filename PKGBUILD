# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgbase=python-nptdms
pkgname=('python-nptdms' 'python2-nptdms')
pkgver=0.13.0
pkgrel=1
pkgdesc="Cross-platform, NumPy based module for reading TDMS files produced by LabView."
arch=('any')
url="https://pypi.python.org/pypi/npTDMS"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/28/23/311302474725e25fa0a846dfb779b4e061f2e469708c40381294745cc73a/npTDMS-${pkgver}.tar.gz")
sha256sums=('93bf0e05e133f56f4deb3c833badd2e7bfe5f6082dd027eb1ac1cf915e57f420')

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

