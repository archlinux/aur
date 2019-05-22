# Maintainer: Jakob Nixdorf <flocke@shadowice.org>

pkgbase=python-nptdms
pkgname=('python-nptdms' 'python2-nptdms')
pkgver=0.14.0
pkgrel=1
pkgdesc="Cross-platform, NumPy based module for reading TDMS files produced by LabView."
arch=('any')
url="https://pypi.python.org/pypi/npTDMS"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/6e/f7/cf5515f7b69e520c0c069545d64b24a0f2602189c7848bf94132774aabc1/npTDMS-${pkgver}.tar.gz")
sha256sums=('96e060229d4de5034999147faa1b14c0af0b5acd8259ce43a473830307af1537')

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

  # Rename so it doesn't conflict with the python-nptdms package
  mv "${pkgdir}/usr/bin/tdmsinfo" "${pkgdir}/usr/bin/tdmsinfo-python2"
}

