# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgbase=python-ipdb
pkgname=(python-ipdb python2-ipdb)
pkgver=0.10.3
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="http://pypi.python.org/pypi/ipdb"
makedepends=('python-setuptools' 'python2-setuptools' 'ipython' 'ipython2')
arch=("any")
license=("BSD")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('2d03f36d174d30d40f41a68d96874d1b44dc8622d325b53294a1aaf28b5e3ccaf6ae3875067bef3509c537cfea03fb5364f7bfc3dee2d7df072ea73cab60284a')

prepare() {
  cp -a ipdb-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/ipdb-$pkgver
  python setup.py build

  cd "$srcdir"/ipdb-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/ipdb-$pkgver
  python setup.py test

  cd "$srcdir"/ipdb-$pkgver-py2
  python2 setup.py test
}

package_python-ipdb() {
  depends=("ipython")

  cd ipdb-$pkgver
  python setup.py install -O1 --root="$pkgdir"

  ln -s ipdb3 "$pkgdir"/usr/bin/ipdb
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}

package_python2-ipdb() {
  depends=("ipython2")

  cd ipdb-$pkgver-py2
  python2 setup.py install -O1 --root="$pkgdir"

  mv "$pkgdir"/usr/bin/ipdb{,2}
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.txt
}
