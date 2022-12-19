# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-ipdb
pkgver=0.13.10
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="https://pypi.python.org/pypi/ipdb"
arch=("any")
license=("BSD")
depends=('ipython')
makedepends=('python-setuptools' 'python-tomli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('49829625ae66a6ed4d1ed6d68a0fc6002446bd79132bedd5ca0683f06a66cfcec13ba885fc1d20b7835b1fa29ae9537188a7d953cf4d074e1dc39726202a4031')

build() {
  cd ipdb-$pkgver
  python setup.py build
}

check() {
  cd ipdb-$pkgver
  python setup.py test
}

package() {
  cd ipdb-$pkgver
  python setup.py install -O1 --root="$pkgdir"
  ln -s ipdb3 "$pkgdir"/usr/bin/ipdb
  install -Dm644 COPYING.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
