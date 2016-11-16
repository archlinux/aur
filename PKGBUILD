pkgbase=python-multiprocess
pkgname=('python-multiprocess' 'python2-multiprocess')
pkgver=0.70.4
pkgrel=1
pkgdesc="better multiprocessing and multithreading in python"
url="http://trac.mystic.cacr.caltech.edu/project/pathos/wiki.html"
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-dill' 'python2-dill')
source=("https://github.com/uqfoundation/multiprocess/archive/multiprocess-${pkgver}.tar.gz")
sha1sums=('18417f3b5c4cddebc773def35b6479626f54bb26')

build() {
  mv "${srcdir}"/multiprocess-multiprocess-$pkgver "${srcdir}"/multiprocess-$pkgver
  cp -r "${srcdir}"/multiprocess-$pkgver "${srcdir}"/multiprocess-$pkgver-py2

  cd "${srcdir}"/multiprocess-$pkgver
  python setup.py build

  cd "${srcdir}"/multiprocess-$pkgver-py2
  python2 setup.py build
}

package_python-multiprocess() {
  depends=('python-dill')

  cd "${srcdir}/multiprocess-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-multiprocess() {
  depends=('python2-dill')

  cd "${srcdir}/multiprocess-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

