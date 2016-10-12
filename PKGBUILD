pkgbase=python-pyscaffold
pkgname=('python-pyscaffold' 'python2-pyscaffold')
pkgver=2.5.7
pkgrel=1
pkgdesc="Python project template generator with batteries included"
url="http://pyscaffold.readthedocs.org/"
arch=(any)
license=('BSD')
makedepends=('python-setuptools-scm' 'python2-setuptools-scm' 'python-six' 'python2-six' 'python-pbr' 'python2-pbr')
source=("pyscaffold-${pkgver}::git+https://github.com/blue-yonder/pyscaffold.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cp -r "${srcdir}"/pyscaffold-$pkgver "${srcdir}"/pyscaffold-$pkgver-py2

  cd "${srcdir}"/pyscaffold-$pkgver
  python setup.py build

  cd "${srcdir}"/pyscaffold-$pkgver-py2
  python2 setup.py build
}

package_python-pyscaffold() {
  depends=('python-six' 'python-pbr')

  cd "${srcdir}/pyscaffold-$pkgver"
  python setup.py install --root=${pkgdir}
  rm -r ${pkgdir}/usr/share/pyscaffold/docs
}

package_python2-pyscaffold() {
  depends=('python2-six' 'python2-pbr')

  cd "${srcdir}/pyscaffold-$pkgver"
  python2 setup.py install --root=${pkgdir}
  rm -r ${pkgdir}/usr/share/pyscaffold/docs
  mv ${pkgdir}/usr/bin/putup ${pkgdir}/usr/bin/putup2
}

