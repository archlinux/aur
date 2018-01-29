# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>


pkgname=('python2-msmbuilder')
pkgver=3.8.0
pkgrel=1
pkgdesc='A python package which implements a series of statistical models for high-dimensional time-series'
url='http://msmbuilder.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('python2-mdtraj' 'python2-cvxopt' 'python2-scikit-learn' 'python2-numpydoc' 'python2-pytables')
optdepends=()
makedepends=('python2-setuptools')
options=('!libtool')
source=("https://github.com/msmbuilder/msmbuilder/archive/${pkgver}.tar.gz")
sha1sums=('dce2a640ecd277554b9a425d094737cd136f509d') 

build() {
  msg2 "Building msmbuilder - Python 2"
  cd "${srcdir}/msmbuilder-${pkgver}"
  python2 setup.py build

}
package() {
  msg2 "Installing msmbuilder python2"
  cd "${srcdir}/msmbuilder-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
  
  #Rename msmb executable to avoid problems with "python-msmbuilder"
  cd ${pkgdir}/usr/bin
  mv msmb msmb_py2
}
