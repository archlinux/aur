# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-binary-memcached
pkgver=0.29.0
pkgrel=1
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
depends=('python-six' 'python-uhashring')
makedepends=('python-setuptools' 'python-uhashring')
checkdepends=('memcached' 'python-pytest' 'python-trustme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/v$pkgver.tar.gz")
sha512sums=('cc0dfd1a22a6b0d6d2c39d2039173d97764d4800f940e533bb46cdfeb6a05591caa0251f8ebe2203dcd76f5bdc7cd111b37d4680b4fe0f39e7657df6e9942a80')

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
