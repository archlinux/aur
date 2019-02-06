
pkgbase=ipython-ipyparallel
pkgname=('ipython-ipyparallel' 'ipython2-ipyparallel')
pkgver=6.2.3
pkgrel=1
pkgdesc="Interactive Parallel Computing in Python"
url="https://github.com/ipython/ipyparallel"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
optdepends=('openmpi: to use the MPI Launchers in ipcluster command')
source=("https://github.com/ipython/ipyparallel/archive/${pkgver}.tar.gz")
sha256sums=('fa82384a59604c30e4f90a768f9e047d600b06c6bccf3c67f86fc26f899ed941')

prepare() {
  cp -r "${srcdir}/ipyparallel-$pkgver" "${srcdir}/ipyparallel-$pkgver-py2"
}

build() {
  cd "${srcdir}/ipyparallel-$pkgver"
  python setup.py build
  
  cd "${srcdir}/ipyparallel-$pkgver-py2"
  python2 setup.py build
} 

package_ipython-ipyparallel() {
  depends=('ipython')
  conflicts=('ipython2-ipyparallel')

  cd "${srcdir}/ipyparallel-$pkgver"
  python setup.py install --root="${pkgdir}"
}

package_ipython2-ipyparallel() {
  depends=('ipython2')
  conflicts=('ipython-ipyparallel')

  cd "${srcdir}/ipyparallel-$pkgver-py2"
  python2 setup.py install --root="${pkgdir}"
  mv "${pkgdir}"/usr/bin/ipcluster "${pkgdir}"/usr/bin/ipcluster2
  mv "${pkgdir}"/usr/bin/ipcontroller "${pkgdir}"/usr/bin/ipcontroller2
  mv "${pkgdir}"/usr/bin/ipengine "${pkgdir}"/usr/bin/ipengine2
}
