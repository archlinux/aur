# Maintainer: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
pkgver=2.1
pkgrel=2
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-setuptools' 'ipython')
makedepends=('cython')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rkern/line_profiler/archive/$pkgver.tar.gz")
sha256sums=('5625157e76e1f70c237c7df07389b48028aa1b94ec630aaa5f094d5755bcaa76')

build() {
  cd "${srcdir}/line_profiler-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/line_profiler-${pkgver}"
  py_ver=$(python -c 'import sys; print("{0.major}.{0.minor}".format(sys.version_info))')
  PYTHONPATH="./build/lib.linux-${CARCH}-${py_ver}" python -m unittest discover -v tests
}

package() {
  cd "${srcdir}/line_profiler-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
