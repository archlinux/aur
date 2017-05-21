pkgbase=python-soundfile
pkgname=('python-soundfile' 'python2-soundfile')
pkgver=0.9.0
pkgrel=1
pkgdesc="An audio library based on libsndfile, CFFI and NumPy"
url="https://github.com/bastibe/PySoundFile"
arch=('any')
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'libsndfile' 'python-cffi' 'python2-cffi' 'python-numpy' 'python2-numpy')
source=("https://github.com/bastibe/PySoundFile/archive/${pkgver}.tar.gz")
sha1sums=('54ef9ffa57854513f7bd0de6bdaaa7e4f108e65e')

build() {
  cp -r "${srcdir}"/PySoundFile-$pkgver "${srcdir}"/PySoundFile-$pkgver-py2

  cd "${srcdir}"/PySoundFile-$pkgver
  python setup.py build

  cd "${srcdir}"/PySoundFile-$pkgver-py2
  python2 setup.py build
}

package_python-soundfile() {
  depends=('python-cffi' 'libsndfile' 'python-numpy')

  cd "${srcdir}/PySoundFile-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-soundfile() {
  depends=('python2-cffi' 'libsndfile' 'python2-numpy')

  cd "${srcdir}/PySoundFile-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

