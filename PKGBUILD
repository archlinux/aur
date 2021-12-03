# Maintainer: Pierre Sauvage <m.sauvage.pierre@gmail.com> 

pkgname=cqlsh-git
pkgdesc="CQL shell for apache cassandra"
pkgver=4.0.1
pkgrel=1
arch=('any')
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'cython')
conflicts=('cqlsh')
url="https://github.com/apache/cassandra"
source=("git+https://github.com/apache/cassandra.git#branch=trunk")
md5sums=('SKIP')

build() {
  cd "$srcdir/cassandra/pylib"
  python3 setup.py build
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp "$srcdir/cassandra/bin/cqlsh" $pkgdir/usr/bin/cqlsh
  cp "$srcdir/cassandra/bin/cqlsh.py" $pkgdir/usr/bin/cqlsh

  cd "$srcdir/cassandra/pylib"
  python3 setup.py install --prefix=/usr --root="$pkgdir"
} 
