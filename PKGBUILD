# Contributor: Hector <hsearaDOTatDOTgmailDOTcom>


pkgname=('python-msmbuilder')
pkgver=3.3.1
pkgrel=5
pkgdesc='A python package which implements a series of statistical models for high-dimensional time-series'
url='http://msmbuilder.org/'
license=("LGPL")
arch=('i686' 'x86_64')
depends=('python-mdtraj' 'python-cvxopt' 'python-scikit-learn' 'python-pytables' 'python-numpydoc')
optdepends=()
makedepends=('python-setuptools')
options=('!libtool')
source=("https://github.com/msmbuilder/msmbuilder/archive/${pkgver}.tar.gz"
        "patch.i0.c")
sha1sums=('fcb5ad6fabb5aead4c78d3fed782665d090c0caa'
          'f0129777e7f9fb28074b86d47d6bb8b94f763063') 

prepare() {
  cd "$srcdir"
  cp patch.i0.c msmbuilder-3.3.1/msmbuilder/hmm/cephes/
  cd  msmbuilder-3.3.1/msmbuilder/hmm/cephes/
  patch i0.c < patch.i0.c
}

build() {
  msg2 "Building msmbuilder - Python 3"
  cd "${srcdir}/msmbuilder-${pkgver}"
  python setup.py build

}
package() {
  msg2 "Installing msmbuilder python3"
  cd "${srcdir}/msmbuilder-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune
}
