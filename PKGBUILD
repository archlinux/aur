pkgbase=python-soundfile
pkgname=('python-soundfile' 'python2-soundfile')
pkgver=0.10.0
pkgrel=1
pkgdesc="An audio library based on libsndfile, CFFI and NumPy"
url="https://github.com/bastibe/PySoundFile"
arch=('any')
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'libsndfile' 'python-cffi' 'python2-cffi' 'python-numpy' 'python2-numpy')
source=("https://github.com/bastibe/PySoundFile/archive/${pkgver}.tar.gz")
sha256sums=('d417177bb7e701f06b625f37711be0e94c2c75e74ab3c39a368481a449a91c5c')

build() {
  cp -r "${srcdir}"/SoundFile-$pkgver "${srcdir}"/SoundFile-$pkgver-py2

  cd "${srcdir}"/SoundFile-$pkgver
  python setup.py build

  cd "${srcdir}"/SoundFile-$pkgver-py2
  python2 setup.py build
}

package_python-soundfile() {
  depends=('python-cffi' 'libsndfile' 'python-numpy')

  cd "${srcdir}/SoundFile-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1
}

package_python2-soundfile() {
  depends=('python2-cffi' 'libsndfile' 'python2-numpy')

  cd "${srcdir}/SoundFile-$pkgver"
  python2 setup.py install --root=${pkgdir} --optimize=1
}

