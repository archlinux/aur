# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Brecht Machiels <brecht at mos6581 dot org>

pkgname=python-pyprof2calltree
pkgver=1.3.1
pkgrel=2
pkgdesc="Help visualize profiling data from cProfile with kcachegrind"
url="https://pypi.python.org/pypi/pyprof2calltree/"
arch=('any')
license=('BSD')
depends=('python')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/p/pyprof2calltree/pyprof2calltree-${pkgver}.tar.gz)
sha1sums=('6bb428e6001acbe7b7b372f0d54eb54293674705')

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
