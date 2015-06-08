
pkgname=python2-pythran-git
pkgver=r1243.e0b91f2
pkgrel=1
pkgdesc="A claimless python to c++ converter"
arch=('i686' 'x86_64')
url="http://pythonhosted.org/pythran/"
license=('custom')
depends=('python2-networkx' 'python2-ply' 'python2-numpy' 'gperftools' 'gmp' 'boost')
makedepends=('git' 'cmake')
provides=('python2-pythran')
conflicts=('python2-pythran')
source=("git+https://github.com/serge-sans-paille/pythran.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pythran"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
} 

build() {
  cd $srcdir/pythran
  python2 setup.py build
}

package() {
  cd $srcdir/pythran
  python2 setup.py install --root=$pkgdir
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
