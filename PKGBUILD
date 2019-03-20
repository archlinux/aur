# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgbase=python-ipdb
pkgname=(python-ipdb python2-ipdb)
pkgver=0.12
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="http://pypi.python.org/pypi/ipdb"
makedepends=('python-setuptools' 'python2-setuptools' 'ipython' 'ipython2')
arch=("any")
license=("BSD")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('00df9861f586b70fa9ef75ac09ab2e60c9785c9472ba2a5b10a546bfc5834e38f78538dd27f080251f6236c2b7b5af46b16d587b2777424d84d240abc8b59788')

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
