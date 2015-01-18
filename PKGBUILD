# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Brecht Machiels <brecht at mos6581 dot org>

pkgname=pyprof2calltree
pkgver=1.3.2
pkgrel=1
pkgdesc="Help visualize profiling data from cProfile with kcachegrind"
url="https://pypi.python.org/pypi/pyprof2calltree/"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=(http://pypi.python.org/packages/source/p/pyprof2calltree/pyprof2calltree-${pkgver}.tar.gz)
sha1sums=('ef2d80d3da4cf70d8550464fd8d506c37f4e13f3')

build() {
  cd "$srcdir/pyprof2calltree-$pkgver"
  python setup.py build
  sed -n '/# Copyright/,/# THE SOFTWARE\./p' pyprof2calltree.py > LICENSE
}

package() {
  cd "$srcdir/pyprof2calltree-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
