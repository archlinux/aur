# Maintainer: Boyan Ding <boyan.j.ding@gmail.com>

pkgbase=python-pygtrie
pkgname=('python-pygtrie' 'python2-pygtrie')
pkgver=2.3.3
pkgrel=1
pkgdesc="Python library implementing a trie data structure"
arch=(any)
url="https://github.com/google/pygtrie"
license=('Apache')
source=(
  "https://pypi.io/packages/source/p/pygtrie/pygtrie-${pkgver}.tar.gz"
  LICENSE
)
sha256sums=(
  '2204dbd95584f67821da5b3771c4305ac5585552b3230b210f1f05322608db2c'
  'cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30'
)

prepare() {
  cp -a pygtrie-$pkgver{,-py2}
}

build() {
  cd pygtrie-$pkgver
  python setup.py build
}

package_python-pygtrie() {
  depends=('python' 'python-setuptools')

  cd pygtrie-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/python-pygtrie/LICENSE"
}

package_python2-pygtrie() {
  depends=('python2' 'python2-setuptools')

  cd pygtrie-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/python2-pygtrie/LICENSE"
}
