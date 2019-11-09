# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: xantares

pkgname=python-pythran
pkgver=0.9.4.post0
pkgrel=1
pkgdesc="Ahead of Time compiler for numeric kernels"
arch=('i686' 'x86_64')
url="https://pythran.readthedocs.io/"
license=('BSD')
makedepends=('python-numpy' 'python-setuptools')
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('d5d913c86cdc3a0c6387e796ec1f65c1563ca34f10201c43ae5acc757c70fd8d')
depends=(
  'python' 'python-networkx' 'python-ply' 'python-numpy'
  'python-beniget>=0.2.0' 'python-gast>=0.3.0' 'python-six' 'gperftools' 'gmp'
)
optdepends=(
  'boost: Use system Boost libraries'
  'python-colorlog: Coloured output during compilation'
)
provides=('python-pythran')
conflicts=('python-pythran-git')

build() {
  cd "$srcdir"/pythran-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/pythran-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -m755 -d "${pkgdir}/usr/share/licenses/python-pythran"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/python-pythran/"
}
