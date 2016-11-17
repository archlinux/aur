pkgbase=python-hope
pkgname=('python-hope' 'python2-hope')
pkgver=0.6.1
pkgrel=1
pkgdesc="A Python Just-In-Time compiler for astrophysical computations"
url="https://github.com/cosmo-ethz/hope"
arch=(any)
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/cosmo-ethz/hope/archive/${pkgver}.tar.gz")
md5sums=('2218151116f010d55a752b591408be81')

build() {
  cp -r "${srcdir}"/hope-$pkgver "${srcdir}"/hope-$pkgver-py2

  cd "${srcdir}"/hope-$pkgver
  python setup.py build

  cd "${srcdir}"/hope-$pkgver-py2
  python2 setup.py build
} 

package_python-hope() {
  depends=('python-numpy' 'python-sympy')

  cd "${srcdir}"/hope-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-hope() {
  depends=('python2-numpy' 'python2-sympy')

  cd "${srcdir}"/hope-$pkgver-py2
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

