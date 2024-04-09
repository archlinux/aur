# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-binary-memcached
pkgver=0.31.2
pkgrel=2
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
depends=('python-six' 'python-uhashring')
makedepends=('python-setuptools')
checkdepends=('memcached' 'python-pytest' 'python-trustme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/v$pkgver.tar.gz")
sha512sums=('e0d18df48dd62f483fe93313d90425e6c168c1f3ab2a9e248bde339f986d6d40fdee88fd6d26d64b45154f1442abc2083b04ff4b87ce68c09d0f8e963a6b11ee')

prepare() {
  sed -i '/typing/d' python-binary-memcached-$pkgver/setup.py
}

build() {
  cd python-binary-memcached-$pkgver
  python setup.py build
}

check() {
  cd python-binary-memcached-$pkgver
  python -m pytest
}

package() {
  cd python-binary-memcached-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
