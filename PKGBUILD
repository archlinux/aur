pkgbase=python-pathos
pkgname=('python-pathos' 'python2-pathos')
pkgver=0.2.0
pkgrel=1
pkgdesc="arallel graph management and execution in heterogeneous computing"
url="http://trac.mystic.cacr.caltech.edu/project/pathos/wiki.html"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-ppft' 'python2-ppft' 'python-pox' 'python2-pox' 'python-multiprocess' 'python2-multiprocess')
source=("https://github.com/uqfoundation/pathos/archive/pathos-${pkgver}.tar.gz")
sha1sums=('5005eb6b56e1c0f67f9e95b51adf369865c1a6cd')

build() {
  cp -r "${srcdir}"/pathos-pathos-$pkgver "${srcdir}"/pathos-$pkgver
  cp -r "${srcdir}"/pathos-$pkgver "${srcdir}"/pathos-$pkgver-py2

  cd "${srcdir}"/pathos-$pkgver
  python setup.py build

  cd "${srcdir}"/pathos-$pkgver-py2
  python2 setup.py build
}

package_python-pathos() {
  depends=('python-ppft' 'python-pox' 'python-multiprocess')

  cd "${srcdir}/pathos-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-pathos() {
  depends=('python2-ppft' 'python2-pox' 'python2-multiprocess')

  cd "${srcdir}/pathos-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
  mv ${pkgdir}/usr/bin/pathos_server.py ${pkgdir}/usr/bin/pathos_server2.py
  mv ${pkgdir}/usr/bin/pathos_tunnel.py ${pkgdir}/usr/bin/pathos_tunnel2.py
  mv ${pkgdir}/usr/bin/portpicker.py ${pkgdir}/usr/bin/portpicker2.py
  mv ${pkgdir}/usr/bin/tunneled_pathos_server.py ${pkgdir}/usr/bin/tunneled_pathos_server2.py
}

