# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-objgraph
pkgver=3.5.0
pkgrel=7
pkgdesc="Draws Python object reference graphs with graphviz"
url="https://github.com/mgedmin/objgraph"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('graphviz')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mgedmin/objgraph/archive/$pkgver.tar.gz")
sha512sums=('50bf1967d6696547598628d49f3c827f1535d6de032fb429881e523f144bb57e128d09f43d280b89a0f9205ca97ef10331e0da1dc86637af0214bfd7aa4cba3b')

prepare() {
  # Only for python38-ipython support
  sed -i "/'graphviz'/d" objgraph-$pkgver/setup.py
}

build() {
  cd "$srcdir"/objgraph-$pkgver
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/objgraph-$pkgver
  python3.8 setup.py test
}

package() {
  cd objgraph-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
