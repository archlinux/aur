# Maintainer: Guillaume HOrel <guillaume.horel@gmail.com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
_pkgname=line_profiler
pkgver=3.0.2
pkgrel=1
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('x86_64')
license=('BSD')
depends=('python-setuptools' 'ipython')
makedepends=('cython')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/pyutils/line_profiler/archive/$pkgver.tar.gz"
    "cython.patch")

sha256sums=('8eb9683b339083220adec19f391006435efb47ef63fc1200b965a88b48068f26'
            'e275bc6da60b49fa778d53a91acb8b9a866f80cf7dc2ff47b42c78e661b256c7')

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
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
