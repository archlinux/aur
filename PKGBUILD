# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-binary-memcached
pkgver=0.31.0
pkgrel=2
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
depends=('python-six' 'python-uhashring')
makedepends=('python-setuptools' 'python-uhashring')
checkdepends=('memcached' 'python-pytest' 'python-trustme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/v$pkgver.tar.gz")
sha512sums=('8b83e09b80f0de86e9348c444f650d125878921f079fc2d4e4a79d1ad54a49217401498c80ca65ce864d8bb434dc2f20e2c25ff12bc46e351488508cd752c9fd')

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
