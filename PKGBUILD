# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgbase=python-ipdb
pkgname=(python-ipdb python2-ipdb)
pkgver=0.11
pkgrel=2
pkgdesc="IPython-enabled pdb"
url="http://pypi.python.org/pypi/ipdb"
makedepends=('python-setuptools' 'python2-setuptools' 'ipython' 'ipython2')
arch=("any")
license=("BSD")
source=("$pkgbase-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('a8398088b192af213a763432406211abceae07ecc1268f0063604727279b8b534c4b72fbff492d43b3cc28f840156d7fb70d99b97ce17554a333d37657aca584')

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
