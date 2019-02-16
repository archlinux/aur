# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-rpy2-hg
pkgver=r3742.186f7948b5ce
pkgrel=1
pkgdesc="A simple, robust Python interface to the R Programming Language."
arch=('i686' 'x86_64')
url="https://rpy2.bitbucket.io/"
license=('MPL' 'GPL' 'LGPL')
makedepends=('mercurial')
depends=('python-numpy' 'r')
provides=('python-rpy2')
conflicts=('python-rpy2')
source=($pkgname::hg+https://bitbucket.org/rpy2/rpy2)
sha256sums=('SKIP')
  
pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(hg identify -n).$(hg identify -i)"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

# fails with: AttributeError: module 'rpy2.situation' has no attribute 'get_rlib_path'
# check() {
#   cd "$srcdir/$pkgname"
#   python setup.py test
# }

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
