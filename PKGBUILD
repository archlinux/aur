# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgbase=python-ipdb
pkgname=(python-ipdb python2-ipdb)
pkgver=0.9.1
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="http://pypi.python.org/pypi/ipdb"
makedepends=('python-setuptools' 'python2-setuptools' 'ipython' 'ipython2' 'git')
arch=("any")
license=("BSD")
source=("git+https://github.com/gotcha/ipdb.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a ipdb{,-py2}
}

build() {
  cd "$srcdir"/ipdb
  python setup.py build

  cd "$srcdir"/ipdb-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/ipdb
  python setup.py test

  cd "$srcdir"/ipdb-py2
  python2 setup.py test
}

package_python-ipdb() {
  depends=("ipython")

  cd "$srcdir"/ipdb
  python setup.py install -O1 --root="$pkgdir"

  ln -s ipdb3 "$pkgdir"/usr/bin/ipdb
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}

package_python2-ipdb() {
  depends=("ipython2")

  cd "$srcdir"/ipdb-py2
  python2 setup.py install -O1 --root="$pkgdir"

  mv "$pkgdir"/usr/bin/ipdb{,2}
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}
