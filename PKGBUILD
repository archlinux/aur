# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-braintree
pkgver=4.20.0
pkgrel=1
pkgdesc="Braintree Python Library"
arch=('any')
url="https://www.braintreepayments.com/docs/python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/braintree/braintree_python/archive/$pkgver.tar.gz")
sha512sums=('1b8a4693796befb128cf790859b7ff528303e080455489679ab3a413b31c810b25f61a20e04681068ffce0d73d1679c14b0a3374c3efbf854781e977b8d53a44')

build() {
  cd braintree_python-$pkgver
  python setup.py build
}

check() {
  cd braintree_python-$pkgver
  python -m unittest discover tests/unit
}

package() {
  cd braintree_python-$pkgver
  python setup.py install -O1 --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
