
pkgbase=ipython-ipyparallel
pkgname=('ipython-ipyparallel' 'ipython2-ipyparallel')
pkgver=6.0.2
pkgrel=1
pkgdesc="Interactive Parallel Computing in Python"
url="https://github.com/ipython/ipyparallel"
arch=(any)
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/ipython/ipyparallel/archive/${pkgver}.tar.gz")
md5sums=('015b49162b424bc19ad70db27be8c19f')

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

  cd "${srcdir}/ipyparallel-$pkgver"
  python setup.py install --root="${pkgdir}"
}

package_ipython2-ipyparallel() {
  depends=('ipython2')

  cd "${srcdir}/ipyparallel-$pkgver-py2"
  python2 setup.py install --root="${pkgdir}"
  mv "${pkgdir}"/usr/bin/ipcluster "${pkgdir}"/usr/bin/ipcluster2
  mv "${pkgdir}"/usr/bin/ipcontroller "${pkgdir}"/usr/bin/ipcontroller2
  mv "${pkgdir}"/usr/bin/ipengine "${pkgdir}"/usr/bin/ipengine2
}
