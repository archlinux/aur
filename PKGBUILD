# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
_pkgname=line_profiler
pkgver=3.3.1
pkgrel=1
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('x86_64')
license=('BSD')
depends=('python-setuptools' 'ipython')
makedepends=('cython')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pyutils/line_profiler/archive/$pkgver.tar.gz"
    "cython.patch")

sha256sums=('6c0caf8fe2241a81d23b4a937e6a497adaae1848a68d175863f2143c14ccfe7a'
            '3acc85c3eebe59d94edfa1624e68d06d3f4fad342d5380606f69c566d93c8131')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../cython.patch
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-${pkgver}"
  python setup.py build_ext --inplace
  python -m unittest discover -v tests
}

package() {
  cd "line_profiler-${pkgver}"
  python setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
