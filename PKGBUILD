# Maintainer: Dario Giovannetti <dev@dariogiovannetti.net>

pkgbase=python-apispec-webframeworks
pkgname=(python-apispec-webframeworks python2-apispec-webframeworks)
pkgver=0.3.0
pkgrel=1
pkgdesc="Web framework plugins for apispec (formally in apispec.ext)."
url="https://github.com/marshmallow-code/apispec-webframeworks"
license=('MIT')
arch=('any')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/marshmallow-code/apispec-webframeworks/archive/$pkgver.tar.gz")
sha512sums=('e301e7f84522c695044ba0621a78116986e7cedd1299bd8d13410a84ac546bf13c9d798ec53272a70f4c8fa3975a5ba55f59b7ab1a1b1df0a41d8564588068a6')

prepare() {
  cp -a apispec-webframeworks-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/apispec-webframeworks-$pkgver
  python setup.py build

  cd "$srcdir"/apispec-webframeworks-$pkgver-py2
  python2 setup.py build
}

package_python-apispec-webframeworks() {
  depends=('python')

  cd apispec-webframeworks-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-apispec-webframeworks() {
  depends=('python2')

  cd apispec-webframeworks-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
