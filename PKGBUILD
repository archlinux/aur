pkgbase=python-sox
pkgname=('python-sox' 'python2-sox')
pkgver=1.3.0
pkgrel=1
pkgdesc="Python wrapper around SoX"
url="https://github.com/rabitt/pysox"
arch=(any)
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'sox')
source=("https://pypi.io/packages/source/s/sox/sox-${pkgver}.tar.gz")
md5sums=('36353e16e54b463e76877a408ef89318')

prepare() {
  cd "${srcdir}"/sox-$pkgver
}

build() {
  cp -r "${srcdir}"/sox-$pkgver "${srcdir}"/sox-$pkgver-py2

  cd "${srcdir}"/sox-$pkgver
  python setup.py build

  cd "${srcdir}"/sox-$pkgver-py2
  python2 setup.py build
}

package_python-sox() {
  depends=('python' 'sox')

  cd "${srcdir}/sox-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sox() {
  depends=('python2' 'sox')

  cd "${srcdir}/sox-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

