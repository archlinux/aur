# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-ipdb
pkgver=0.13.12
pkgrel=3
pkgdesc="IPython-enabled pdb"
url="https://pypi.python.org/pypi/ipdb"
arch=("any")
license=("BSD")
depends=('ipython')
makedepends=('python-setuptools' 'python-tomli')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gotcha/ipdb/archive/$pkgver.tar.gz")
sha512sums=('a8636dc6adceedc0f287c7c11f785484098df72bef838d84420bd72c8c2874abd95ab72885ba4efb9f7e61b5638018db908dc55a5667ab60b93692f43417ccbe')

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
