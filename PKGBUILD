# Maintainer: Michael Schubert <mschu.dev at google mail>

pkgname=python2-copperhead-git
pkgver=r348.6e624e3
pkgrel=1
pkgdesc="Provides a data-parallel subset of Python for NVidia GPU programming (CUDA)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/copperhead/"
license=('Apache 2.0')
depends=('python2-pycuda' 'python2-codepy' 'python2-decorator' 'thrust')
makedepends=('mercurial' 'python2-pytools' 'scons')
optdepends=('boost' 'python2-matplotlib' 'python2-scipy' 'plac')
replaces=('copperhead-hg')
source=($pkgname::git+https://github.com/copperhead/copperhead)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}
  
package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

