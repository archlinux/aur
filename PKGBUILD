# Maintainer: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>
# Contributor: xantares

pkgname=python-pythran
pkgver=0.9.9
pkgrel=1
pkgdesc="Ahead of Time compiler for numeric kernels"
arch=('i686' 'x86_64')
url="https://pythran.readthedocs.io/"
license=('BSD')
makedepends=('python-numpy' 'python-setuptools')
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('aaabc97f30ad46d1d62303323de6697d2933779afa4666c15b0f433cb50825b1')
depends=(
  'python' 'python-networkx' 'python-ply' 'python-numpy'
  'python-beniget>=0.3.0' 'python-gast>=0.4.0' 'python-six' 'gperftools' 'gmp'
)
optdepends=(
  'boost: Use system Boost libraries'
  'clang: Alternative C++ compiler'
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
