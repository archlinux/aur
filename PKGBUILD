pkgbase=python-salib
pkgname=('python-salib' 'python2-salib')
pkgver=1.1.3
pkgrel=1
pkgdesc="Sensitivity Analysis Library in Python (Numpy). Contains Sobol, Morris, and FAST methods."
url="https://github.com/jdherman/SALib"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy' 'python-pyscaffold' 'python2-pyscaffold' 'git')
source=("https://github.com/jdherman/SALib/archive/v$pkgver.tar.gz")
sha256sums=('e6256c2dfcffb98bb975fcd6fd2330e1a5d2727da648b23f0938ad35d552206b')

build() {
  cp -r "${srcdir}"/SALib-$pkgver "${srcdir}"/SALib-$pkgver-py2

  cd "${srcdir}"/SALib-$pkgver
  git init
  python setup.py build

  cd "${srcdir}"/SALib-$pkgver-py2
  git init
  python2 setup.py build
}

package_python-salib() {
  depends=('python-numpy')

  cd "${srcdir}/SALib-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-salib() {
  depends=('python2-numpy')

  cd "${srcdir}/SALib-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

