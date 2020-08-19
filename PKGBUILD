# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-binary-memcached
pkgver=0.30.0
pkgrel=1
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
depends=('python-six' 'python-uhashring')
makedepends=('python-setuptools' 'python-uhashring')
checkdepends=('memcached' 'python-pytest' 'python-trustme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/v$pkgver.tar.gz")
sha512sums=('9bb02d5406496a304a93a1d8a0cd75f674485d7246773babd576db2f59fb6df025ec0bd8391250fb1680ffc82fbbb6dc463515e0c0233e5e75f4f358cb0cbd66')

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
