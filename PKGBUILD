# Maintainer: Trougnouf (Benoit Brummer) <trougnouf@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Michel Zou

_name=pythran
pkgbase=python-pythran-git
pkgname=('python-pythran-git')
pkgver=0.11.0.r0.gb87f45893
pkgrel=1
pkgdesc="claimless python to c++ converter"
arch=('i686' 'x86_64')
url="https://github.com/serge-sans-paille/pythran"
license=('BSD')
depends=('python-networkx' 'python-ply' 'python-colorlog' 'python-numpy' 'python-gast03' 'python-six' 'gperftools' 'gmp' 'boost')
makedepends=('gperftools'  'python-setuptools' 'git' 'cmake')
provides=('python-pythran')
conflicts=('python-pythran')
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
}

package() {
  cd "${_name}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
