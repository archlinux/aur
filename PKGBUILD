pkgbase=python-pythran-git
# pkgname=('python-pythran-git' 'python2-pythran-git')
pkgname=('python-pythran-git')
pkgver=r1886.09e36dbb
pkgrel=1
pkgdesc="A claimless python to c++ converter"
arch=('i686' 'x86_64')
url="http://pythonhosted.org/pythran/"
license=('BSD')
makedepends=('python-networkx' 'python2-networkx' 'python-ply' 'python2-ply' 'python-colorlog' 'python2-colorlog' 'python-numpy' 'python2-numpy' 'gperftools'  'python-setuptools' 'python2-setuptools' 'python-gast' 'python2-gast' 'python-six' 'python2-six' 'gmp' 'boost' 'git' 'cmake')
source=("git+https://github.com/serge-sans-paille/pythran.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/pythran
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cp -r "$srcdir"/pythran "$srcdir"/pythran-py2

  cd "$srcdir"/pythran
  python setup.py build

  cd "$srcdir"/pythran-py2
  python2 setup.py build
}

package_python-pythran-git() {
  depends=('python-networkx' 'python-ply' 'python-colorlog' 'python-numpy' 'python-gast' 'python-six' 'gperftools' 'gmp' 'boost')
  provides=('python-pythran')
  conflicts=('python-pythran')

  cd "$srcdir"/pythran
  python setup.py install --root=$pkgdir --optimize=1
}

# package_python2-pythran-git() {
#   depends=('python2-networkx' 'python2-ply' 'python2-colorlog' 'python2-numpy' 'python2-gast' 'python2-six' 'gperftools' 'gmp' 'boost')
#   provides=('python2-pythran')
#   conflicts=('python2-pythran')
# 
#   cd "$srcdir"/pythran-py2
#   python2 setup.py install --root=$pkgdir --optimize=1
# }
