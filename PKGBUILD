# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-ipdb
pkgver=0.13.13
pkgrel=1
pkgdesc="IPython-enabled pdb"
url="https://pypi.python.org/pypi/ipdb"
arch=("any")
license=("BSD")
depends=('ipython')
makedepends=('python-setuptools' 'python-tomli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('e6052d1b32b8ba499a42a121eba1ab7e814c81ac738ffaa088524840f54420546c9b3fa8c8c6beef61f6f2eb24f57984fa9953a3e60b986d14e542dcf9e3c6c8')

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
