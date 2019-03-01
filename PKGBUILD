# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-binary-memcached
pkgver=0.28.0
pkgrel=2
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
depends=('python-six' 'python-uhashring')
makedepends=('python-setuptools' 'python-uhashring')
checkdepends=('memcached' 'python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/v$pkgver.tar.gz")
sha512sums=('8edd603c8ee67826ab7f2d064d2cad67c2a4b695e09d763cbefc988a0576f6d06730358983f77a903e64b7aec3ac511dbb3e58cfcb51030b604a2524e482d6fa')

prepare() {
  sed -i '/typing/d' python-binary-memcached-$pkgver/setup.py
}

build() {
  cd python-binary-memcached-$pkgver
  python setup.py build
}

check() {
  cd python-binary-memcached-$pkgver
  python setup.py pytest
}

package() {
  cd python-binary-memcached-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
