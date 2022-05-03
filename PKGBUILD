pkgname=pypy3-pythran
pkgver=0.11.0
pkgrel=1
pkgdesc='Ahead of Time compiler for numeric kernels'
arch=(any)
url='https://pythran.readthedocs.io/'
license=(BSD)
depends=(pypy3-ply pypy3-numpy pypy3-beniget xsimd boost)
makedepends=(pypy3-setuptools)
source=(https://files.pythonhosted.org/packages/source/p/pythran/pythran-$pkgver.tar.gz)
sha256sums=('0b2cba712e09f7630879dff69f268460bfe34a6d6000451b47d598558a92a875')

build() {
  cd pythran-$pkgver
  pypy3 setup.py build
}

package() {
  cd pythran-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1 --skip-build
  rm -r "$pkgdir"/opt/pypy3/lib/py*/site-packages/pythran/{boost,xsimd} # Remove bundled boost and xsimd
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
