# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-boltons
pkgver=21.0.0
pkgrel=1
pkgdesc="Functionality that should be in the standard library. Like builtins, but Boltons."
url="https://github.com/mahmoud/boltons"
license=('BSD')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/mahmoud/boltons/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-python-3.10.patch::https://github.com/mahmoud/boltons/commit/270e974975984f662f998c8f6eb0ebebd964de82.patch)
sha512sums=('5f5d642ab8ce0bc26133f4bd5059071bc86ca8e6619ebac796d522a0e4c39b958176ccc9de9a56e0448b24bdcf569e73f51011d5a9fc875bdef12a363f106018'
            '5726b60cc7618ef8d7c698d2cf2b49a66a6a1354c1c5652e0bbef85cf9b9bf9220b23e0f4272d6068259e7bfcbe2fadde55073e6dd54ce9743221e2a1a3283e0')

prepare() {
  patch -d boltons-$pkgver -p1 < $pkgname-python-3.10.patch
}

build() {
  cd boltons-$pkgver
  python setup.py build
}

check() {
  cd boltons-$pkgver
  pytest
}

package() {
  cd boltons-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
