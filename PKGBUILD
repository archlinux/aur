# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michel Zou

_name=pythran
pkgbase=python-pythran-git
pkgname=('python-pythran-git' 'python2-pythran-git')
pkgver=0.9.5.r5.g3671d777c
pkgrel=1
pkgdesc="claimless python to c++ converter"
arch=('i686' 'x86_64')
url="https://github.com/serge-sans-paille/pythran"
license=('BSD')
makedepends=('python-networkx' 'python2-networkx' 'python-ply' 'python2-ply' 'python-colorlog' 'python2-colorlog' 'python-numpy' 'python2-numpy' 'gperftools'  'python-setuptools' 'python2-setuptools' 'python-gast' 'python2-gast' 'python-six' 'python2-six' 'gmp' 'boost' 'git' 'cmake')
source=("git+https://github.com/serge-sans-paille/pythran.git")
md5sums=('SKIP')


pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cp -r "$srcdir"/${_name} "$srcdir"/${_name}-py2

  cd "${_name}"
  python setup.py build

  cd "${_name}"-py2
  python2 setup.py build
}

package_python-pythran-git() {
  depends=('python-networkx' 'python-ply' 'python-colorlog' 'python-numpy' 'python-gast' 'python-six' 'gperftools' 'gmp' 'boost')
  provides=('python-pythran')
  conflicts=('python-pythran')

  cd "${_name}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_python2-pythran-git() {
  depends=('python2-networkx' 'python2-ply' 'python2-colorlog' 'python2-numpy' 'python2-gast' 'python2-six' 'gperftools' 'gmp' 'boost')
  provides=('python2-pythran')
  conflicts=('python2-pythran')

  cd "${_name}"-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  mv "$pkgdir"/usr/bin/pythran "$pkgdir"/usr/bin/pythran2
  mv "$pkgdir"/usr/bin/pythran-config "$pkgdir"/usr/bin/pythran2-config
}
